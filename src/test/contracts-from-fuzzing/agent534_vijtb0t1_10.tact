struct InnerOne {
    a: Int;
    b: String;
}

struct InnerTwo {
    c: Bool;
    d: Int?;
}

struct Outer {
    in1: InnerOne;
    in2: InnerTwo;
}

contract NestStructs {
    field: Outer;
    init() {
        self.field = Outer{
            in1: InnerOne{ a:1, b:"b" },
            in2: InnerTwo{ c:true, d:null },
        };
    }
}