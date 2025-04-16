struct NestedWithDefaults {
   n: Int = 5;
   inner: InnerNested;
}

struct InnerNested {
   a: Bool = false;
   b: String = "s";
}

contract DefNested {
    val: NestedWithDefaults;

    init() {
        self.val = NestedWithDefaults{inner: InnerNested{}};
    }
}