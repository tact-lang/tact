struct Agg {
  b: Bool;
  s: String;
  num: Int;
}

contract AggStruct {
  data: Agg;

  init() {
    self.data = Agg{
      b: true,
      s: "xyz",
      num: 555
    };
  }
}