message(123) DataMsg { x: Int }

struct NestedMsgOpt {
  inner: DataMsg?;
}

contract NestedMsgOptStore {
  storage: NestedMsgOpt;
  init() {
    self.storage = NestedMsgOpt { inner:null };
  }
  receive() {}
}