struct InnerDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
}

struct Outer {
    inner: InnerDefaults = InnerDefaults{};
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{};
    }
}