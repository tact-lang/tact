struct HasOpt {
  optInt: Int?;
}
struct Holder {
  inner: HasOpt;
  val: Int;
}
contract TestContract {
  s: Holder;

  init() {
    self.s = Holder{
      inner: HasOpt{ optInt: null },
      val: 123
    };
  }
}