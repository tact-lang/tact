struct NestedOptional {
    s1: String?;
    s2: String?;
    n: Int?;
    b: Bool?;
}

contract OptsInStruct {
    d: NestedOptional;

    init() {
        self.d = NestedOptional{
            s1: null,
            s2: "x",
            n: null,
            b: true
        };
    }
}