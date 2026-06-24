struct OptionalBool {
  x: Bool?;
  y: Bool?;
}

contract TestContract {
  data: OptionalBool;

  init() {
    self.data = OptionalBool{x:null, y:true};
  }
}