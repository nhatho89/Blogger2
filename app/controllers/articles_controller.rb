class ArticlesController < ApplicationController
  include ArticlesHelper
  def index
    @articles = Article.all
  end

  def show

    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  # def create
 # This is what the form returns. A hash with all the data of the new article.
 # {"utf8"=>"✔", "authenticity_token"=>"UDbJdVIJjK+qim3m3N9qtZZKgSI0053S7N8OkoCmDjA=",
 # "article"=>{"title"=>"Fourth Sample", "body"=>"This is my fourth sample article."},
 # "commit"=>"Create", "action"=>"create", "controller"=>"articles"}
  #   @article = Article.new
  #   @article.title = params[:article][:title]
  #   @article.body = params[:article][:body]
  #   @article.save
  #   redirect_to article_path(@article)
  # end
  # Alternative way to write the same method
  # def create
  #   @article = Article.new(
  #     title: params[:article][:title],
  #     body: params[:article][:body])
  #   @article.save
  #   redirect_to article_path(@article)
  # end

  # Lets just pass the whole hash

  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article '#{@article.title}' Created!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' Deleted!"

    redirect_to articles_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

end
