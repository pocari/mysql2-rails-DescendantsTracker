#!/bin/sh

bundle install --path=vendor/bundle && bin/rails r 'p ActiveRecord::ConnectionAdapters::AbstractAdapter.descendants'
