contract EmptyStructValue {
  data: EmptyIn?;
  init() {
    self.data = null;
  }
}

struct EmptyIn {
  a: Int; // not truly empty, minimal
}
