struct Wrap {
  val: Int;
}

contract ManyOptionalWrappers {
    w1: Wrap?;
    w2: Wrap?;
    w3: Wrap?;

    init() {
        self.w1 = null;
        self.w2 = null;
        self.w3 = null;
    }
}