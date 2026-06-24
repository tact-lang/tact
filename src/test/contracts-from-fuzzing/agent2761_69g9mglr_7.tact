struct Inner4 {
    a: Int;
    b: String;
    c: Bool?;
}

struct MultiNested {
    innerOne: Inner4;
    innerTwo: Inner4;
    innerThree: Inner4;
    lastField: String?;
}

contract ManyNestedStructsTest {
    rec1: MultiNested;
    rec2: MultiNested;
    
    init() {
        self.rec1 = MultiNested{
            innerOne: Inner4{a:1,b:"a",c:null},
            innerTwo: Inner4{a:2,b:"b",c:true},
            innerThree: Inner4{a:3,b:"c",c:false},
            lastField: null
        };
        self.rec2 = MultiNested{
            innerOne: Inner4{a:4,b:"x",c:null},
            innerTwo: Inner4{a:5,b:"y",c:true},
            innerThree: Inner4{a:6,b:"z",c:false},
            lastField: "hello"
        };
    }
}
