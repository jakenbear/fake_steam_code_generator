#PRODUCT CLASS
class Codes

  def initialize(how_many)
    # Instance variables
    @how_many = how_many
    @codes = []
  end

  # Makes a RANDOM Uppercase blob of size : number
  def make_blob(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
  end

  # Builds a steam code with three blobs x 5
  def build_code
    blob1 = make_blob(5).upcase
    blob2 = make_blob(5).upcase
    blob3 = make_blob(5).upcase
    final_code = blob1 + "-" + blob2 + "-" + blob3
  end

  # Grabs the Codes array for the Clipboard
  def grab_codes
    buff = ""
    @codes.each do |c|
      buff += c
      buff += "\n"
    end
    Clipboard.copy(buff)
  end

  def gen_codes
    how_many = @how_many
    for i in 0..how_many-1
      code = build_code
      @codes.push code
    end
    grab_codes
    return @codes
  end

end #Class
