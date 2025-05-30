struct OptionalNest {
  f1: Int?;
  f2: Bool?;
  f3: String?;
}

contract TestContract {
    val1: OptionalNest?;

    init() {
        self.val1 = OptionalNest{ f1: null, f2: true, f3: null };
    }
}