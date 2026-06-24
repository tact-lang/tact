struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct Wrapper {
    nested: NestedDefaults;
}

contract WrapDefaults {
    s: Wrapper;

    init() {
        self.s = Wrapper{
            nested: NestedDefaults{}
        };
    }
}