struct OptNested {
  val1: Int?;
  val2: Bool?;
}

contract TestContract {
    field: OptNested;
    init() {
        self.field = OptNested {
            val1: null,
            val2: true
        };
    }
}