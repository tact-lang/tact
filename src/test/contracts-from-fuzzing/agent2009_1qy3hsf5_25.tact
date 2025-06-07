struct DoubleNest {
    s1: StructA;
    s2: StructA;
}

struct StructA {
    x: Int;
    y: Bool;
    text: String?;
}

contract RecTest {
    level1: DoubleNest;
    init() {
        self.level1 = DoubleNest{
            s1: StructA{x:1,y:true,text:null},
            s2: StructA{x:2,y:false,text:"hi"}
        };
    }
}