struct NestedWithDefaults {
    a: Int = 1;
    b: InnerDefault;
}

struct InnerDefault {
    x: Int = 10;
    y: Int?;
}

contract NestedDefaultContract {
    data: NestedWithDefaults;

    init() {
        self.data = NestedWithDefaults{
            b: InnerDefault{
                y: null
            }
        };
    }
}
