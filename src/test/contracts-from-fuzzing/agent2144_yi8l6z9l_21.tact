struct FieldTest {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract FieldOrder {
    f: FieldTest;

    init() {
        self.f = FieldTest{
            a:1,b:true,c:"hello",d:null,e:false,f:null
        };
    }
}
