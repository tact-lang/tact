struct A { x: Int?; y: Int; }

contract OrderTest {
  val: A;
  
  init() {
    self.val = A{ y:10, x:null };
  }
}