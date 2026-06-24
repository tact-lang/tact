struct NestedStructsWithDefaults {
    a: Int = 1;
    nested: NestedLevel;
}

struct NestedLevel {
    b: Bool = true;
    s: String = "str";
}

contract TestContract {
    data: NestedStructsWithDefaults;

    init() {
        self.data = NestedStructsWithDefaults{
            nested: NestedLevel{}
        };
    }
}
