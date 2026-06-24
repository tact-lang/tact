struct DefaultsDeep {
    inner: SubDefaults;
    other: Int;
}

struct SubDefaults {
    flag: Bool = true;
    val: Int = 5;
}

contract NestedDefaults {
    state: DefaultsDeep;

    init() {
        self.state = DefaultsDeep{
            inner: SubDefaults{},
            other: 42
        };
    }
}