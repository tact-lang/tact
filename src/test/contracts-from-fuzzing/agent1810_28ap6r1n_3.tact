struct DeepNested {
  i: Int; 
  b: Bool; 
}

struct Wrapper {
  d: DeepNested; 
  s: String;
  flag: Bool?;
}

contract NestedStructStorage {
  w: Wrapper;

  init() {
    self.w = Wrapper{
      d: DeepNested{i: 42, b: true},
      s: "hello",
      flag: null
    };
  }
}