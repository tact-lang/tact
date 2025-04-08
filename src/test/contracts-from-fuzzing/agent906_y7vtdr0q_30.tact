struct TailOpt {
    x: Int;
    y: Int?;
}

contract OptLastField {
    data: TailOpt;

    init() {
        self.data = TailOpt{
            x: 123,
            y: null,
        };
    }
}