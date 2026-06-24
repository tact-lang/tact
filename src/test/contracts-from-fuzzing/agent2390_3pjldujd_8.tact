struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OptInNested {
    info: NestedOpt;
    init() {
        self.info = NestedOpt{ a: null, b: false, c: null };
    }
}