require "base64"
Before do
    page.current_window.resize_to(1440, 900)

    @rest_list_page = RestaurantListPage.new
    @rest_page = RestaurantPage.new
    @order_page = OrderPage.new
end
Before('@Tasty_Treats') do
    visit 'restaurants/tasty-treats/menu'
end

Before('@green_food') do
    visit "restaurants/green-food/menu"
end

After do
   shot_file = page.save_screenshot("log/screenshot.png")
   shot_b64 = Base64.encode64(File.open(shot_file, "rb").read)
   embed(shot_b64, "image/png", "Screenshot") # Cucumber anexa a screenshot
end