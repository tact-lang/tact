struct NestedStringOpt {
    s: String?;
    b: Bool?;
}

contract NestStrOpt {
    f: NestedStringOpt;

    init() {
        self.f = NestedStringOpt{
            s: null,
            b: null,
        };
    }
}
