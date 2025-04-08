struct NestedDefaults {
    x: Int;
    y: Bool = true;
}

struct OuterDefaults {
    a: NestedDefaults;
    b: Int = 5;
}

contract TestContract {
    test: OuterDefaults;

    init() {
        self.test = OuterDefaults{
            a: NestedDefaults{ x: 9 },
        };
    }
}