struct NestedDefaultOpt {
    a: Int = 1;
    b: Bool?;
    c: String = "hi";
}

contract TestDefOpt {
    s: NestedDefaultOpt;
    init() {
        self.s = NestedDefaultOpt{
            // omit b to stay null, rely on defaulted a and c
        };
    }
}