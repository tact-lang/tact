struct MultipleOptions {
  x: Int?;
  y: Int?;
  z: Int?;
}

contract Test {
  val: MultipleOptions;
  init() {
    self.val = MultipleOptions{x:null,y:null,z:null};
  }
}