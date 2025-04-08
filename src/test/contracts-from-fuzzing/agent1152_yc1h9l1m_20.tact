struct Contained {
  i: Int;
  b: Bool;
  s: String;
}

contract MultiOptional {
  p: Contained?;

  init() {
    self.p = Contained{i:4, b:true, s:"hello"};
  }
}