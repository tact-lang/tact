struct FlatOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
}

contract FlatNullable {
    state: FlatOpt;

    init() {
        self.state = FlatOpt{
            a: null,
            b: true,
            c: null,
            d: 42,
        };
    }
}