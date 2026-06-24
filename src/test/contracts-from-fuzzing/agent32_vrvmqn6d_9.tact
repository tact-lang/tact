struct StrangelyOrdered {
  z: Int;
  a: String;
  y: Bool;
  b: Int;
}

contract Test {
  val: StrangelyOrdered;
  init() {
    self.val = StrangelyOrdered{z:1,a:"x",y:true,b:2};
  }
}