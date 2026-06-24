struct WrappedOpt {
    x: Int?;
    y: String?;
}

contract OptFields {
    optData: WrappedOpt;
    counter: Int;

    init() {
        self.optData = WrappedOpt{
            x: null,
            y: "hello",
        };
        self.counter = 0;
    }
}