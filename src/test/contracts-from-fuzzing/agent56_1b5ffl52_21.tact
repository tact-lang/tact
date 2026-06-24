struct OptionalNested {
    opt: Int?;
}

contract OptionalInOptional {
    data: OptionalNested?;

    init() {
        self.data = OptionalNested{
            opt: 42,
        };
    }
}