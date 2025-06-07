struct InlineOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract InlineOptionals {
    optVal: InlineOpt;

    init() {
        self.optVal = InlineOpt{
            x: null,
            y: true,
            z: null,
        };
    }
}
