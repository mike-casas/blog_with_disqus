class ArticlesController < ApplicationController

  before_action :article_find, only: [:show, :edit,:update, :destroy]


  def index
    @articles = Article.all.order('created_at DESC')
  end

  def new
    @article= Article.new
  end

  def create
    @article= Article.create(params_article)
    if @article.save
      redirect_to @article
    end
  end

  def show
  end

  def edit

  end

  def update
    @article.update_attributes(params_article)
    if @article.save
      redirect_to @article
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private

  def params_article
    params.require(:article).permit(:title, :description)
  end

  def article_find
    @article= Article.find(params[:id])
  end
end
