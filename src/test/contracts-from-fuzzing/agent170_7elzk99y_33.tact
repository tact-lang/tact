// Message nested inside another message in persistent state
message(0x1) InnerM { x: Int }
message(0x2) OuterM { inner: InnerM }

contract NestedMsgField {
  data: OuterM;

  init() {
    self.data = OuterM{ inner: InnerM{ x: 42 } };
  }
}