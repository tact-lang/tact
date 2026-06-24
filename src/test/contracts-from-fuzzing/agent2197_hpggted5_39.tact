struct InnerA {
    a:Int;
}

struct InnerB {
    b:Bool;
}

struct Outer {
    aa:InnerA;
    bb:InnerB;
}

contract NestedMix {
    data: Outer;

    init() {
        self.data = Outer{
            aa: InnerA{a:123},
            bb: InnerB{b:true}
        };
    }
}