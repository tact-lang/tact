struct NestedDefaults {
    innermost: Int = 1;
}

struct Middle {
    x: Int = 2;
    n: NestedDefaults = NestedDefaults{};
}

struct Top {
    y: Bool = false;
    m: Middle = Middle{};
}

contract TestContract {
    param: Top;
    init() {
        self.param = Top{};
    }
}