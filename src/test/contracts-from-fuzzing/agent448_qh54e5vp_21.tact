struct Sub {
    optInt: Int?;
    optBool: Bool?;
}

contract NestedOptionals2 {
    s: Sub;

    init() {
        self.s = Sub{ optInt: 5, optBool: null };
    }
}