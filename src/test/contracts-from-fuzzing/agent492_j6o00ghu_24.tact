struct N1 {
  s: String;
}
struct N2 {
  n1: N1?;
}
contract OptNested {
  field: N2?;
  init() {
    self.field = null;
  }
}
