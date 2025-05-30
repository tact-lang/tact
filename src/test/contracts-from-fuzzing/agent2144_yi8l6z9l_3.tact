struct NestedOpt {
    sopt: String?;
    iopt: Int?;
}

contract OptFields {
    s: NestedOpt;

    init() {
        self.s = NestedOpt{ sopt: null, iopt: 42 };
    }
}
