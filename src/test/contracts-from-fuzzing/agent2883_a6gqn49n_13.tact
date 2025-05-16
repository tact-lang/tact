struct NestedWithDefaults {
    foo: Int = 1;
    bar: Bool = true;
}

struct OuterDefaults {
    inn: NestedWithDefaults;
    count: Int = 5;
}

contract NestedDefaultContract {
    data: OuterDefaults;

    init() {
        self.data = OuterDefaults{
            inn: NestedWithDefaults{}
        };
    }
}