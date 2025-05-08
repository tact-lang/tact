struct OptionalOnly {
    x: Int?;
    y: Bool?;
}

contract EmptyOptStruct {
    data: OptionalOnly;

    init() {
        self.data = OptionalOnly{
            x: null,
            y: null
        };
    }
}