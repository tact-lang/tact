struct InnerStructD {
    d1: Int;
    d2: String;
    d3: Bool;
    d4: Cell?;
}

struct MiddleStructC {
    c1: Bool;
    c2: InnerStructD;
}

struct MiddleStructB {
    b1: String;
    b2: Int?;
    b3: InnerStructD;
}

struct OuterStructA {
    a1: MiddleStructB;
    a2: MiddleStructC;
}

contract ComplexNestedLayers {
    root: OuterStructA;

    init() {
        self.root = OuterStructA{
            a1: MiddleStructB{
                b1:"hi", b2: null, b3:InnerStructD{d1:42, d2:"hello", d3:true, d4:null}},
            a2: MiddleStructC{
                c1:false, c2:InnerStructD{d1:99,d2:"end",d3:false,d4:emptyCell()}}
        };
    }
}