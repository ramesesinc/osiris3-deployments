#!/bin/sh
RUN_DIR=`pwd`
cd ..
BASE_DIR=`pwd`


cd $BASE_DIR/appserver/sms && docker-compose up -d


cd $RUN_DIR
