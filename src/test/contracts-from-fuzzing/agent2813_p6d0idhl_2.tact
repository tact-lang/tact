struct NestedOpt {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract TestOptional {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            x: null,
            y: true,
            s: null
        };
    }
}
