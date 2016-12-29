class Gimei::Address
  attr_reader :zip_code, :prefecture, :city, :town

  def initialize
    @zip_code   = ZipCode.new
    @prefecture = Prefecture.new
    @city       = City.new
    @town       = Town.new
  end

  def kanji
    "#{prefecture.kanji}#{city.kanji}#{town.kanji}"
  end

  def hiragana
    "#{prefecture.hiragana}#{city.hiragana}#{town.hiragana}"
  end

  def katakana
    "#{prefecture.katakana}#{city.katakana}#{town.katakana}"
  end

  alias_method :to_s, :kanji

  class ZipCode
    def hyphen
      '%03d'%rand(1...899) + '-' + '%04d'%rand(1...9999)
    end

    def without_hyphen
      hyphen.sub!(/-/, '')
    end
  end

  class Prefecture
    def code
      @prefectures[0]
    end

    def kanji
      @prefectures[1]
    end

    def hiragana
      @prefectures[2]
    end

    def katakana
      @prefectures[3]
    end

    def initialize
      @prefectures = Gimei::ADDRESSES['addresses']['prefecture'].sample
    end

    alias_method :to_s, :kanji
  end

  class City
    def kanji
      @cities[0]
    end

    def hiragana
      @cities[1]
    end

    def katakana
      @cities[2]
    end

    def initialize
      @cities = Gimei::ADDRESSES['addresses']['city'].sample
    end

    alias_method :to_s, :kanji
  end

  class Town
    def kanji
      @towns[0]
    end

    def hiragana
      @towns[1]
    end

    def katakana
      @towns[2]
    end

    def initialize
      @towns = Gimei::ADDRESSES['addresses']['town'].sample
    end

    alias_method :to_s, :kanji
  end
end
