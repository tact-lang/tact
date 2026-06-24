struct Inner {
  x: Int;
  y: Bool;
}

contract Test1 {
  p1: Int;
  p2: Bool;
  p3: String;
  p4: Inner;
  
  init() {
    self.p1 = 1;
    self.p2 = true;
    self.p3 = "hi";
    self.p4 = Inner{ x: 5, y: false };
  }
}