struct InnerA {
    aa: Int;
}
struct InnerB {
    bb: Bool;
}
struct Outer {
    innerA: InnerA;
    innerB: InnerB;
}

contract MultiStruct {
    outer: Outer;

    init() {
        self.outer = Outer{
            innerA: InnerA{aa: 50},
            innerB: InnerB{bb: true}
        };
    }
}