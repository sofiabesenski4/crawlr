require 'rails_helper'

RSpec.describe "webpages/edit", type: :view do
  before(:each) do
    @webpage = assign(:webpage, Webpage.create!(
      url: "MyText",
      screenshot: nil
    ))
  end

  it "renders the edit webpage form" do
    render

    assert_select "form[action=?][method=?]", webpage_path(@webpage), "post" do

      assert_select "textarea[name=?]", "webpage[url]"

      assert_select "input[name=?]", "webpage[screenshot]"
    end
  end
end
