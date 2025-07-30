struct Rec1 {
    x: Int;
    y: Bool;
}

struct Rec2 {
    a: Rec1;
    b: Int;
}

struct Rec3 {
    m: Rec2;
    n: String;
}

contract NestedRecStruct {
    rec: Rec3;

    init() {
        self.rec = Rec3{
            m: Rec2{
                a: Rec1{x:7,y:true},
                b:77
            },
            n:"deep"
        };
    }
}