struct InnerStruct {
    a: Int;
    b: String;
}

contract OptionalNested {
    param: InnerStruct?;

    init() {
        self.param = InnerStruct{
            a: 1,
            b: "hi"
        };
    }
}
