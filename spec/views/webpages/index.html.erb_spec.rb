require 'rails_helper'

RSpec.describe "webpages/index", type: :view do
  before(:each) do
    assign(:webpages, [
      Webpage.create!(
        url: "MyText",
        screenshot: nil
      ),
      Webpage.create!(
        url: "MyText",
        screenshot: nil
      )
    ])
  end

  it "renders a list of webpages" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
