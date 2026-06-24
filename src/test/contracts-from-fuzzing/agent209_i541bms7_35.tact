// Contract using optional Address, Int and nested optional
struct SubO {
  z: Int?;
}

contract MixOptTypes {
  a: Address?;
  b: Int?;
  c: SubO?;

  init() {
    self.a = null;
    self.b = 55;
    self.c = null;
  }
}