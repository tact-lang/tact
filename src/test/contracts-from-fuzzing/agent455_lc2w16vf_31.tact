struct SOptOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedOptionalAll {
    sopt: SOptOpt?;
    init() {
        self.sopt = SOptOpt{a: null, b: true, c: null};
    }
}