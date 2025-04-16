struct InnerMost { a:Int; b:Int; }
struct MiddleStruct1 { x:Int; inner:InnerMost; }
struct MiddleStruct2 { y:Int; inner:InnerMost; optInner:InnerMost?; }

struct OuterStruct {
    m1: MiddleStruct1;
    m2: MiddleStruct2;
}

contract MixedNestedContract {
    nested: OuterStruct;

    init() {
        self.nested = OuterStruct{
            m1: MiddleStruct1{ x:5, inner:InnerMost{a:1,b:2} },
            m2: MiddleStruct2{ y:3, inner:InnerMost{a:10,b:20}, optInner:null }
        };
    }
}
