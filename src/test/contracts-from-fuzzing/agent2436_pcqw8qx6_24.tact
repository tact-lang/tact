struct HasManyStrings {
  s1: String;
  s2: String;
  s3: String;
  s4: String;
}

contract LotStrings {
  field: HasManyStrings;

  init() {
    self.field = HasManyStrings{
      s1:"one",s2:"two",s3:"three",s4:"four"
    };
  }
}