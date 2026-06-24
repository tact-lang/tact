struct Inner {
  x: Int;
}

message Msg {
  y: Int;
}

contract MixTypes {
  val: Inner = Inner{ x: 5 };
  msgVal: Msg = Msg{ y: 6 };
  optStr: String? = null;

  init() {}
}