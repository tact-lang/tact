struct Complex {
    nested1: Nested;
    nested2: NestedOpt;
}

struct Nested {
    a: Int;
    b: Bool;
}

struct NestedOpt {
    c: Int?;
    d: Bool?;
}

contract Test {
    data: Complex;
    init() {
        self.data = Complex{
            nested1: Nested{a:1,b:true},
            nested2: NestedOpt{c:null,d:false}
        };
    }
}