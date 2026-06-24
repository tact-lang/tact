struct MultipleStructs {
    a: StructA;
    b: StructB;
}

struct StructA {
    x: Int;
    y: Bool;
}

struct StructB {
    p: String;
    q: Bool?;
}

contract TestContract {
    ms: MultipleStructs;

    init() {
        self.ms = MultipleStructs{
            a: StructA{x:7,y:true},
            b: StructB{p:"hi",q:null}
        };
    }
}