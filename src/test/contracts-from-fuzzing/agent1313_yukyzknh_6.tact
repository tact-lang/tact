struct InnerOption {
    s: String?;
}

contract OptionalInnerFieldContract {
    record: InnerOption;

    init() {
        self.record = InnerOption{
            s: null
        };
    }
}