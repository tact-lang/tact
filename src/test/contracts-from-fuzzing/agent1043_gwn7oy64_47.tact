// Persistent state with optionals + serialization
contract TestContract {
  x: Int? as int64;
  y: Bool?;
  z: String?;

  init() {
    self.x = null;
    self.y = null;
    self.z = null;
  }
}