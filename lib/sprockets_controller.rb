class SprocketsController < ActionController::Base
  caches_page :show, :if => Proc.new { SprocketsApplication.use_page_caching }
  
  def show
    render :text => uglify(SprocketsApplication.source), :content_type => "text/javascript"
  end
  
  def uglify(text)
    Uglifier.compile(text, :coyright => false, :mangle => false)
  end
end
