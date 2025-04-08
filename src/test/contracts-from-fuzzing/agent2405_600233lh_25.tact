struct InnerM {
  n: Int;
  s: String;
}

message X {
  val: InnerM;
}

contract EmbeddedMsg {
  data: X;

  init() {
    self.data = X{ val: InnerM{ n: 3, s: "zzz" } };
  }
}