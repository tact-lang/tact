struct MultiOpt {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract HasMultiNullable {
    state: MultiOpt;

    init() {
        self.state = MultiOpt{
            a: null,
            b: null,
            c: true
        };
    }
}