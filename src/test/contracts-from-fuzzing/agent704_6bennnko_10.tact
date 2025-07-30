struct Inner1 {
    a: Int;
    b: String;
}

struct Inner2 {
    x: Bool;
    y: String?;
}

struct OuterComplex {
    inner1: Inner1;
    inner2: Inner2;
    opt_field: Int?;
}

contract StructWithStructs {
    composite: OuterComplex;

    init() {
        self.composite = OuterComplex{
            inner1: Inner1{a:42, b:"hi"},
            inner2: Inner2{x:true, y:null},
            opt_field: null
        };
    }
}