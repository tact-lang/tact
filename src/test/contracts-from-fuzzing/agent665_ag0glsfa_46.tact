struct SDefaulted {
  a: Int = 7;
  b: Bool = true;
  c: String = "hello";
}

contract NestedDefaultsContract {
    s: SDefaulted = SDefaulted{};

    init() {
        self.s = self.s;
    }

    receive() {
        let _ = self.s;
    }
}