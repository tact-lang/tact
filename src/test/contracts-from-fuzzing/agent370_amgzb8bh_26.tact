struct S {
 a: Int;
}
contract OptOpt {
 x: S?;
 y: S?;
 z: S?;

 init() {
  self.x = null;
  self.y = null;
  self.z = null;
 }
}