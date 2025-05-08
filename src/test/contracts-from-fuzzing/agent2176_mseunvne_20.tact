struct List {
  one: Int;
  two: String;
  three: Bool;
}

contract StructAsFields {
  one: Int;
  two: String;
  three: Bool;

  data: List;

  init() {
    self.one = 1;
    self.two = "2";
    self.three = true;
    self.data = List{ one:1, two:"2", three:true };
  }
}
