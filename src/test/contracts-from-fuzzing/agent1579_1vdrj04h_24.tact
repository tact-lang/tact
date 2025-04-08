struct InlineOpt {
    a: Int?;
    b: Bool?;
}

contract InlineOptStruct {
    f: InlineOpt;
    init() {
        self.f = InlineOpt{ a: null, b: null };
    }
}