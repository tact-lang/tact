struct StringsStruct {
    a: String;
    b: String;
    c: String?;
    d: String?;
}

contract StringsStructTest {
    s: StringsStruct;

    init() {
        self.s = StringsStruct{a:"a",b:"b",c:null,d:null};
    }
}