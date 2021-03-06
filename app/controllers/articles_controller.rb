class ArticlesController < ApplicationController
  before_action :authenticate_user!, only:[:new,:edit,:create,:update,:destroy]
  before_action :article_find, only: [:show, :edit,:update, :destroy]


  def index
    @articles = Article.all.order('created_at DESC').paginate(:page => params[:page],  :per_page => 10)
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
    params.require(:article).permit(:title, :description,:slug)
  end

  def article_find
    @article= Article.friendly.find(params[:id])
  end
end
