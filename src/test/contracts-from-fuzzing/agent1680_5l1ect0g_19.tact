struct Deep {
  one: Int?;
  two: Int?;
  three: Int?;
  four: Int?;
  five: Int?;
}

contract TestContract {
  d: Deep;

  init() {
    self.d = Deep{one:1, two:null, three:3, four:null, five:5};
  }
}