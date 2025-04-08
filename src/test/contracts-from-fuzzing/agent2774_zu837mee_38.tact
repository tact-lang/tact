// nested message with optional nested message
message(0x2345) InnerMsg { val: Int }

message(0x2468) OuterMsg {
  m: InnerMsg?;
}

struct Holder {
  outer: OuterMsg?
}

contract TestContract {
  val: Holder;

  init() {
    self.val = Holder{
      outer: null
    };
  }
}