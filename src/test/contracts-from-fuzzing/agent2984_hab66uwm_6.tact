struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct Outer {
    inner: NestedDefaults;
    opt: Int?;
}

contract Test7 {
    d: Outer;

    init() {
        self.d = Outer{
            inner: NestedDefaults{},
            opt: null
        };
    }
}
