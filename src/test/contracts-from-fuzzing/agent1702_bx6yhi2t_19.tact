struct NestedBool {
    f: Bool;
}

contract OptionalNestedBool {
    test: NestedBool?;

    init() {
        self.test = NestedBool{f:true};
    }
}
