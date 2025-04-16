struct B1 { val: Int; }
struct B2 { val: Bool; }
struct B3 { val: String; }

contract ManyNested {
  x: B1;
  y: B2;
  z: B3;

  init() {
    self.x = B1{ val:42 };
    self.y = B2{ val:true };
    self.z = B3{ val:"hey" };
  }
}
