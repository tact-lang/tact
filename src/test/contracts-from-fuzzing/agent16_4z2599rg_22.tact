// Testing default initializer for nested optionals in nested structs
struct Inner {
  value: Int?;
}

struct Outer {
  nested: Inner?;
  flag: Bool;
}

contract Test {
  store: Outer;

  init() {
    self.store = Outer{nested:null,flag:true};
  }
}