struct OptionalNested {
    data: Int?;
}

contract OptionalStructField {
    opt: OptionalNested;

    init() {
        self.opt = OptionalNested{
            data: null,
        };
    }
}