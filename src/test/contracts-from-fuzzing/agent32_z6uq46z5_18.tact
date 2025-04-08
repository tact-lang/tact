struct ComplexStruct {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
    e: Int?;
    f: String?;
}

contract ReorderedFieldsTest {
    s: ComplexStruct;
    init() {
        self.s = ComplexStruct{
            a: 1, b: null, c: "hi", d:true, e:null, f:null,
        };
    }
}
