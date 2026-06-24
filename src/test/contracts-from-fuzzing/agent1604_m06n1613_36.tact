struct ManyDefaults {
  a: Int = 1;
  b: Int = 2;
  c: Int = 3;
  d: Bool = true;
  e: Bool = false;
}

contract DefaultsMany {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults{};
    }

    receive() {}
}