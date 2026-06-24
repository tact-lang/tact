struct StrStruct {
    s: String;
    b: Bool;
    n: Int;
}

contract StringFields {
    data: StrStruct;

    init() {
        self.data = StrStruct{
            s: "hello",
            b: true,
            n: 42
        };
    }
}