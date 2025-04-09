struct NestedOpt {
    opt1: Int?;
    opt2: Bool?;
    s: String?;
}

contract OptionalFields {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            opt1: null,
            opt2: true,
            s: null
        };
    }
}