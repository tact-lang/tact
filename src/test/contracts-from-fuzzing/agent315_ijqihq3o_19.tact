struct SInner {
    a: Int;
    b: Bool; 
    c: String;
}

struct SOuter {
    in1: SInner;
    in2: SInner;
    s: String;
}

contract ComplexNested {
    data: SOuter;

    init() {
        self.data = SOuter{
            in1: SInner{ a:1, b:true, c:"x" },
            in2: SInner{ a:2, b:false, c:"y" },
            s: "outer"
        };
    }
}