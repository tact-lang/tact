struct L1 { a: Int }
struct L2 { inner: L1 }
message MsgNested { nest: L2 }

contract MsgInsidePersist {
  data: MsgNested;

  init() {
    self.data = MsgNested{
      nest: L2{ inner: L1{ a: 42 } }
    };
  }
}
