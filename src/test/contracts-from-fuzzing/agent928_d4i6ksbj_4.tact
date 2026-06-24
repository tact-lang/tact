struct OptionalNested {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract OptionalStructField {
    opt: OptionalNested;

    init() {
        self.opt = OptionalNested{
            s: null,
            i: 123,
            b: true,
        };
    }
}