struct NestedDefaults {
    x: Int = 1;
    y: Bool = false;
}

struct Wrapper {
    n: NestedDefaults = NestedDefaults{};
}

contract TestContract {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{};
    }
}