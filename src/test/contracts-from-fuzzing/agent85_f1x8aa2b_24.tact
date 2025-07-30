struct NestedDefaults {
    s: Int = 1;
    t: String = "x";
}

struct Container {
    d: NestedDefaults;
}

contract NestedDefaultsState {
    c: Container;

    init() {
        self.c = Container{ d: NestedDefaults{} };
    }

    receive() {}
}