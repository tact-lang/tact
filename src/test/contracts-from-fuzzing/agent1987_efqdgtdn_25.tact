struct NestedDefaultOptional {
    n: Inner?;
}

struct Inner {
    x: Int = 5;
    y: String?;
}

contract OptionalNestedDefaults {
    nd: NestedDefaultOptional;
    init() {
        self.nd = NestedDefaultOptional{
            n: Inner{y:null}
        };
    }
}