struct InnerDefaults {
    x: Int = 0;
    y: Bool = false;
}

struct Outer {
    d: InnerDefaults;
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{
            d: InnerDefaults{}
        };
    }
}