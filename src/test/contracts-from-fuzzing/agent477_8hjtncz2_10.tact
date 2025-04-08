struct Small1 { x: Int; }
struct Small2 { y: Small1; }
struct Small3 { z: Small2; }

contract CrossNested {
  val: Small3;

  init() {
    self.val = Small3{
      z: Small2{
        y: Small1{ x: 777 }
      }
    };
  }
}