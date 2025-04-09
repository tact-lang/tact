struct NestedOpt {
  a: Int?;
  b: Bool?;
  c: Address?;
}

struct Container {
  nested: NestedOpt;
}

contract Test {
  data: Container;
  init() {
    self.data = Container{
      nested: NestedOpt{a:null, b:true, c:myAddress()}
    };
  }
}