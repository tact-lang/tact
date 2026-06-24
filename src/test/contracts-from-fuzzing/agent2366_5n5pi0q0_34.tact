struct LeafDefault {
    a: Int = 0;
    b: Bool = true;
}

struct MiddleDefault {
    leaf: LeafDefault;
    c: String = "test";
}

contract NestedDefaults {
    m: MiddleDefault;

    init() {
        self.m = MiddleDefault{
            leaf: LeafDefault{},
            c: "test"
        };
    }
}