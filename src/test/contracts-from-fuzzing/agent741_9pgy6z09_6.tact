struct NestedDefaults {
    a: Int;
    b: NestedInner;
}

struct NestedInner {
    x: Int = 5;
    y: Bool?;
}

contract TestNestedDefaults {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            a: 42,
            b: NestedInner{
                y: null
            }
        };
    }
}