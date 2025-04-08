struct InnerOpt {
    foo: Int?;
    bar: Bool;
}

contract OptionalStructField {
    state: InnerOpt?;

    init() {
        self.state = InnerOpt{
            foo: null,
            bar: true
        };
    }
}
