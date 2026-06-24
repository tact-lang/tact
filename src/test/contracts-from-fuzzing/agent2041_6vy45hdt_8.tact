struct InnerOption {
    a: Int?;
    b: Bool;
}

contract OptionalNested {
    data: InnerOption;
    init() {
        self.data = InnerOption{
            a: null,
            b: true,
        };
    }
}