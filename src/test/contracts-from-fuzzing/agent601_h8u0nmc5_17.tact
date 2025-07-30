struct JustOptional {
    opt: Int?;
}

contract OptionalField {
    data: JustOptional;

    init() {
        self.data = JustOptional{
            opt: 777
        };
    }
}
