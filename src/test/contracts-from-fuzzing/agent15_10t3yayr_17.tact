struct DefaultDeep {
    s: DefaultVals;
}

contract DeepDefaults {
    val: DefaultDeep;

    init() {
      self.val = DefaultDeep{
        s: DefaultVals{},
      };
    }
}

struct DefaultVals {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
}