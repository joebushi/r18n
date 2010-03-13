module R18n
  class Locales::No < Locale
    set :title => 'Norsk',
        :sublocales => [],
        
        :week_start => :monday,
        :wday_names => %w{Søndag Mandag Tirsdag Onsdag Torsdag Fredag Lørdag},
        :wday_abbrs => %w{Søn Man Tir Ons Tor Fre Lør},
        
        :month_names => %w{januar februar mars april mai juni juli august
                                   september oktober november desember},
        :month_standalone => %w{Januar Februar Mars April Mai Juni Juli August
                                  September Oktober November Desember},
        :month_abbrs => %w{jan feb mar apr mai jun jul aug sep okt nov des},
        
        :date_format => '%d.%m.%Y',
        :time_format => '%k.%M',
        :time_abbrev => 'kl.',
        :full_format => '%e av %B',
        :year_format => '_, %Y',
        
        :number_decimal => ",",
        :number_group =>   " "
    
    def ordinalize(n)
      if (11..13).include?(n % 100)
        "#{n}th"
      else
        case n % 10
        when 1; "#{n}st"
        when 2; "#{n}nd"
        when 3; "#{n}rd"
        else "#{n}th"
        end
      end
    end
    
    def format_date_full(date, year = true, *params)
      format = full_format
      format = year_format.sub('_', format) if year
      strftime(date, format.sub('%e', ordinalize(date.mday)))
    end
  end
end
