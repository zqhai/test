FROM hub.c.163.com/library/pypy:2-5.6.0 
ENV APP_DIR /usr/src/app 
RUN mkdir -p /var/log/gunicorn 
RUN mkdir -p $APP_DIR 
WORKDIR $APP_DIR EXPOSE 5000 
COPY requirements.txt $APP_DIR/ 
RUN pip install -r requirements.txt -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
COPY src $APP_DIR/src/ 
COPY app_config.py $APP_DIR/ 
COPY app.py $APP_DIR/ 
CMD [ "gunicorn", "--config=app_config.py", "app:app" ]
