struct NestedDefaults {
    foo: Int = 1;
    bar: Bool = true;
}

struct OuterWithNested {
    nest: NestedDefaults;
    x: Int;
}

contract NestedDefaultVals {
    data: OuterWithNested;

    init() {
        self.data = OuterWithNested{
            nest: NestedDefaults{ foo: 5, bar: false },
            x: 9
        };
    }
}