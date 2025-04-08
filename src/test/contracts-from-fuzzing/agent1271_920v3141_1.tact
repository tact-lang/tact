struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inField: Inner;
    optInt: Int?;
    optInner: Inner?;
    text: String;
}

contract NestStructTest {
    data: Outer;    
    init() {
        self.data = Outer{
            inField: Inner{a:0, b:false},
            optInt: null,
            optInner: null,
            text: ""
        };
    }
}