struct InnerOptional {
    foo: Int?;
    bar: Bool?;
}

contract OptionalFields {
    data: InnerOptional;

    init() {
        self.data = InnerOptional{ foo:null, bar:true };
    }
}