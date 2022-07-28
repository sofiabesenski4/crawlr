require 'rails_helper'

RSpec.describe "webpages/new", type: :view do
  before(:each) do
    assign(:webpage, Webpage.new(
      url: "MyText",
      screenshot: nil
    ))
  end

  it "renders new webpage form" do
    render

    assert_select "form[action=?][method=?]", webpages_path, "post" do

      assert_select "textarea[name=?]", "webpage[url]"

      assert_select "input[name=?]", "webpage[screenshot]"
    end
  end
end
