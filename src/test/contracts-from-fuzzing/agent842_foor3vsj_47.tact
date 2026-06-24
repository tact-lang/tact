struct DeepNestedOpt {
  foo: Int?;
}

struct Wrap1 {
  x: DeepNestedOpt?;
}

struct Wrap2 {
  y: Wrap1?;
}

struct Wrap3 {
  z: Wrap2?;
}

contract ManyOptionLayers {
  val: Wrap3?;
  
  init() {
    self.val = null;
  }
  
  receive() {
    let _ = self.val;
  }
}