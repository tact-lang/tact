struct SubNested1 {
  x: Int;
  y: Bool;
}

struct SubNested2 {
  z: String;
  sn1: SubNested1;
}

struct OuterMost {
  sn2: SubNested2;
  flag: Bool;
}

contract UltraNested {
  store: OuterMost;
  
  init() {
    self.store = OuterMost{
        sn2: SubNested2{
            z: "hello",
            sn1: SubNested1{ x: 42, y: true }
        },
        flag: false
    };
  }
}