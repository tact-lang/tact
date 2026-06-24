struct StringStruct {
    a: String;
    b: String?;
    c: Bool;
    d: String?;
}

contract StringHolder {
    myStringStruct: StringStruct;

    init() {
        self.myStringStruct = StringStruct{
            a: "hello",
            b: null,
            c: true,
            d: "world"
        };
    }
}