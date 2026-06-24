struct NestedDefaults {
    val: Int = 42;
}

struct Wrap {
    nested: NestedDefaults;
}

contract NestedDefaultsContract {
    data: Wrap;

    init() {
        self.data = Wrap{
            nested: NestedDefaults{}
        };
    }
}