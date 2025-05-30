struct InnerS {
  x: Int;
  y: Bool;
}

struct MiddleS {
  inner: InnerS;
  z: String;
}

struct OuterS {
  m: MiddleS;
  addr: Address;
}

contract MultiNest {
    data: OuterS;

    init() {
        self.data = OuterS{
            m: MiddleS{
                inner: InnerS{
                    x: 5,
                    y: false
                },
                z: "nest"
            },
            addr: myAddress()
        };
    }
}
