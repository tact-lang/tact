struct OptionalNest {
  inner: Int?;
  nested: Deeper?;
}

struct Deeper {
  val: Bool?;
}

contract TestContract {
  o: OptionalNest;

  init() {
    self.o = OptionalNest{ inner: null, nested: null };
  }
}