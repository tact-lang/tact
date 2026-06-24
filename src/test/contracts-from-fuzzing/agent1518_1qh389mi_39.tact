struct NestedDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Inner;
}

struct Inner {
    x: Int = 3;
    y: Int = 4;
}

contract NestedDef {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{ c: Inner{} };
    }
}