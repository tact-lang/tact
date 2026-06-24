struct NestedWithDefaults {
    id: Int = 7;
    flag: Bool = true;
}

struct Wrapper {
    nested: NestedWithDefaults;
}

contract NestedDefaults {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            nested: NestedWithDefaults{}
        };
    }
}