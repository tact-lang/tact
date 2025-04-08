contract DefaultVals(
  a: Int,
  b: String,
  c: Bool
){}

contract NoDefaults {
  x: Int;
  y: String;
  z: Bool;

  init() {
    self.x = 1;
    self.y = "y";
    self.z = true;
  }
}