struct OptionalRec {
    sub: Inner?;
}

struct Inner {
    value: Int?;
    name: String;
}

contract ChainOpt {
    data: OptionalRec;

    init() {
        self.data = OptionalRec{
            sub: null,
        };
    }
}
