struct O1 {
  a: Int?;
}
struct O2 {
  oo: O1?;
}
struct O3 {
  ooo: O2?;
}
contract DeepOptional {
  val: O3;
  init() {
    self.val = O3{ ooo: O2{ oo: O1{ a:null }}};
  }
}