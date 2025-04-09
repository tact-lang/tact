struct Texts {
  one: String;
  two: String;
  three: String;
}

contract StringFields {
  bunch: Texts;

  init() {
    self.bunch = Texts{
      one:"a",
      two:"b",
      three:"c"
    };
  }
}