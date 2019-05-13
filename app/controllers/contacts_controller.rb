class ContactsController < ApplicationController
  def index
    @excel_headers = [
      "Corporate Name",
      "Contacts",
      "Type of enterprise",
      "Telephone",
      "mailbox",
      "Zip code",
      "Address",
      "post",
      "Registration time",
      "Fax",
      "Website",
      "Regional registration",
      "Industry classification",
      "Main commodities"
    ]

    audio_visual = File.read("#{Rails.root}/app/controllers/Audiovisual.json")
    @audio_visual = JSON.parse(audio_visual)
    kitchen_equipment = File.read("#{Rails.root}/app/controllers/Kitchen Equipment.json")
    @kitchen_equipment = JSON.parse(kitchen_equipment)
    other_house_hold = File.read("#{Rails.root}/app/controllers/Other Household appliances.json")
    @other_house_hold = JSON.parse(other_house_hold)
    petty_appliance = File.read("#{Rails.root}/app/controllers/Petty Appliance.json")
    @petty_appliance = JSON.parse(petty_appliance)

    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename=HouseHold.xlsx"
      }
      format.json {
        render json: @audio_visual
      }
    end
  end

  def index_2
    @excel_headers = [
      "Corporate Name",
      "Contacts",
      "Type of enterprise",
      "Telephone",
      "mailbox",
      "Zip code",
      "Address",
      "post",
      "Registration time",
      "Fax",
      "Website",
      "Regional registration",
      "Industry classification",
      "Main commodities"
    ]

    textile_raw_fabric = File.read("#{Rails.root}/app/controllers/Textile Raw fabric.json")
    @textile_raw_fabric = JSON.parse(textile_raw_fabric)
    apparel = File.read("#{Rails.root}/app/controllers/Apparel.json")
    @apparel = JSON.parse(apparel)
    shoes_and_hat = File.read("#{Rails.root}/app/controllers/Shoes and Hats.json")
    @shoes_and_hat = JSON.parse(shoes_and_hat)
    knitting = File.read("#{Rails.root}/app/controllers/Knitting.json")
    @knitting = JSON.parse(knitting)
    home_textiles = File.read("#{Rails.root}/app/controllers/Home textiles.json")
    @home_textiles = JSON.parse(home_textiles)
    textile_raw_material = File.read("#{Rails.root}/app/controllers/Textile Raw Material.json")
    @textile_raw_material = JSON.parse(textile_raw_material)
    carpet = File.read("#{Rails.root}/app/controllers/Carpet.json")
    @carpet = JSON.parse(carpet)
    apparel_garnish = File.read("#{Rails.root}/app/controllers/Apparel garnish.json")
    @apparel_garnish = JSON.parse(apparel_garnish)
    chemical_fiber = File.read("#{Rails.root}/app/controllers/Chemical fiber.json")
    @chemical_fiber = JSON.parse(chemical_fiber)

    # leather
    box = File.read("#{Rails.root}/app/controllers/leather/Box.json")
    box_json = JSON.parse(box)
    catgut = File.read("#{Rails.root}/app/controllers/leather/Catgut.json")
    catgut_json = JSON.parse(catgut)
    cloth_dec = File.read("#{Rails.root}/app/controllers/leather/Cloth Decoration.json")
    cloth_dec_json = JSON.parse(cloth_dec)
    cow_hide = File.read("#{Rails.root}/app/controllers/leather/Cowhide.json")
    cow_hide_json = JSON.parse(cow_hide)
    fur_cloth = File.read("#{Rails.root}/app/controllers/leather/Fur clothing.json")
    fur_cloth_json = JSON.parse(fur_cloth)
    glove = File.read("#{Rails.root}/app/controllers/leather/Gloves.json")
    glove_json = JSON.parse(glove)
    hand_bag = File.read("#{Rails.root}/app/controllers/leather/Handbag.json")
    hand_bag_json = JSON.parse(hand_bag)
    harness = File.read("#{Rails.root}/app/controllers/leather/Harness.json")
    harness_json = JSON.parse(harness)
    leather = File.read("#{Rails.root}/app/controllers/leather/Leather.json")
    leather_json = JSON.parse(leather)
    other_leather = File.read("#{Rails.root}/app/controllers/leather/Other leather.json")
    other_leather_json = JSON.parse(other_leather)
    peltry = File.read("#{Rails.root}/app/controllers/leather/Peltry.json")
    peltry_json = JSON.parse(peltry)
    pigskin = File.read("#{Rails.root}/app/controllers/leather/Pigskin.json")
    pigskin_json = JSON.parse(pigskin)
    purse = File.read("#{Rails.root}/app/controllers/leather/Purse.json")
    purse_json = JSON.parse(purse)
    reclaim_leather = File.read("#{Rails.root}/app/controllers/leather/Reclaimed leather.json")
    reclaim_leather_json = JSON.parse(reclaim_leather)
    salt_cowhide = File.read("#{Rails.root}/app/controllers/leather/Saltpeter-treatment cowhide.json")
    salt_cowhide_json = JSON.parse(salt_cowhide)
    salt_pigskin = File.read("#{Rails.root}/app/controllers/leather/Saltpeter-treatment Pigskin.json")
    salt_pigskin_json = JSON.parse(salt_pigskin)
    salt_sheepskin = File.read("#{Rails.root}/app/controllers/leather/Saltpeter-treatment Sheepskin.json")
    salt_sheepskin_json = JSON.parse(salt_sheepskin)
    sheep_leather = File.read("#{Rails.root}/app/controllers/leather/Sheep leather.json")
    sheep_leather_json = JSON.parse(sheep_leather)
    suitcase = File.read("#{Rails.root}/app/controllers/leather/Suitcase.json")
    suitcase_json = JSON.parse(suitcase)
    waistband = File.read("#{Rails.root}/app/controllers/leather/Waistband.json")
    waistband_json = JSON.parse(waistband)
    leather_data = [
      box_json,
      catgut_json,
      cloth_dec_json,
      cow_hide_json,
      fur_cloth_json,
      glove_json,
      hand_bag_json,
      harness_json,
      leather_json,
      other_leather_json,
      peltry_json,
      pigskin_json,
      purse_json,
      reclaim_leather_json,
      salt_cowhide_json,
      salt_pigskin_json,
      salt_sheepskin_json,
      sheep_leather_json,
      waistband_json
    ].reduce([], :concat)

    @data = [
      {
        sheet: "Textiles Raw Fabric",
        data: @textile_raw_fabric
      },
      {
        sheet: "Apparel",
        data: @apparel
      },
      {
        sheet: "Shoes and Hat",
        data: @shoes_and_hat
      },
      {
        sheet: "Knitting",
        data: @knitting
      },
      {
        sheet: "Home Textiles",
        data: @home_textiles
      },
      {
        sheet: "Textiles Raw Material",
        data: @textile_raw_material
      },
      {
        sheet: "Leather",
        data: leather_data,
      },
      {
        sheet: "Carpet",
        data: @carpet
      },
      {
        sheet: "Apparel Garnish",
        data: @apparel_garnish
      },
      {
        sheet: "Chemical Fiber",
        data: @chemical_fiber
      }
    ]

    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename=Textiles.xlsx"
      }
    end
  end
end
