struct TwoLevel {
  inner: Int?;
}
contract DefaultStructOptNull {
  val: TwoLevel = TwoLevel{ inner: null };
  init() {
    self.val = TwoLevel{ inner: 7 };
  }
}