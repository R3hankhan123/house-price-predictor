from flask import Flask, render_template, request, redirect, url_for, flash, jsonify
import pickle
import numpy as np
model=pickle.load(open('model1.pkl','rb'))
app = Flask(__name__)

@app.route('/predict',methods=['GET'])    
def predictor():
    area=int(request.args['area'])
    bedrooms=int(request.args['bedrooms'])
    psf=float(request.args['psf'])
    feature_score=int(request.args['feature_score'])
    LocationPremium=float(request.args['LocationPremium'])
    LogPremium=float(request.args['LogPremium'])
    query=np.array([[area,bedrooms,psf,feature_score,LocationPremium,LogPremium]])
    result= model.predict(query)[0]
    return jsonify({'prediction':str(result)}) 
  
                     
if __name__ == '__main__':
    app.run(debug=True)
    app.run(host="10.0.2.2",port="8000")