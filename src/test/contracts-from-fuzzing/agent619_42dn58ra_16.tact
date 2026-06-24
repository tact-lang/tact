struct NestedOpt {
    a: Int?;
    b: Bool?;
}

contract NestedOptStruct {
    s: NestedOpt;

    init() {
        self.s = NestedOpt{ a: null, b: null };
    }
}
