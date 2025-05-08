// test deeply nested optional struct inside persistent storage (allowed)
struct X {
  val: Int;
}
struct Y {
  inner: X?;
}
contract DeepOptStore {
    maybe: Y?;
    init() {
        self.maybe = null;
    }
}