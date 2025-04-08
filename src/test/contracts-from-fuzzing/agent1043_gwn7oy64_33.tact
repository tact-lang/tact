struct Mix {
  i: Int;
  si: Int?;
  s: String;
  ss: String?;
  b: Bool;
  bb: Bool?;
}

contract TestContract {
  mix: Mix;

  init() {
    self.mix = Mix{
      i: 1, si: null, s: "x", ss: null, b: false, bb: null
    };
  }
}