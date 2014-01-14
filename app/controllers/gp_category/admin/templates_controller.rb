class GpCategory::Admin::TemplatesController < Cms::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base

  def pre_dispatch
    return http_error(404) unless @content = GpCategory::Content::CategoryType.find_by_id(params[:content])
    return error_auth unless Core.user.has_priv?(:read, :item => @content.concept)
    @item = @content.templates.find(params[:id]) if params[:id].present?
  end

  def index
    @items = @content.templates.paginate(page: params[:page], per_page: 50)
    _index @items
  end

  def show
  end

  def new
    @item = @content.templates.build
  end

  def create
    @item = @content.templates.build(params[:item])
    _create @item
  end

  def edit
  end

  def update
    @item.attributes = params[:item]
    _update @item
  end

  def destroy
    _destroy @item
  end
end
