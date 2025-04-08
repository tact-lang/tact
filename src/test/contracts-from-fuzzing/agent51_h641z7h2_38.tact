// deeply nested optional + struct optional chain
struct L3 {
  val:Int?;
}
struct L2 {
  val:L3?;
}
struct L1 {
  val:L2?;
}
contract Test {
  f: L1;
  init() {
    self.f = L1{ val: null };
  }
}