struct NestedDefaults {
    x: Int?;
    y: String = "hello";
}

struct Wrapper {
    n: NestedDefaults;
    flag: Bool = true;
}

contract StructWithDefaultsNested {
    compound: Wrapper;

    init() {
        self.compound = Wrapper{
            n: NestedDefaults{
                x: null,
            },
        };
    }
}