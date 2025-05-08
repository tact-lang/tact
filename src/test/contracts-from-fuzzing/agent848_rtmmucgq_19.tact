struct DeeplyOptionalStruct {
    foo: Int?;
    bar: String?;
}

contract DeeplyOptional {
    data: DeeplyOptionalStruct?;

    init() {
        self.data = DeeplyOptionalStruct{
            foo: 99,
            bar: null
        };
    }
}