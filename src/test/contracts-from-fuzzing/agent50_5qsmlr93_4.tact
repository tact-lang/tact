struct Rec {
  n: Int;
  opt: Int?;
  mp: map<Int, Int>;
}

contract Test {
  r: Rec;

  init() {
    self.r = Rec{
      n: 1,
      opt: null,
      mp: emptyMap(),
    };
  }
}