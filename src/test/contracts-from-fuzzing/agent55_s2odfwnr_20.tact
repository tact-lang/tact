struct InnerA { a: Int = 1; }
struct InnerB { b: Int = 2; }
struct InnerC { c: Bool = true; }
struct Middle {
    iA: InnerA;
    iB: InnerB;
    iC: InnerC;
}

contract DeepMixed {
    mid: Middle;

    init() {
        self.mid = Middle{
            iA: InnerA{},
            iB: InnerB{},
            iC: InnerC{}
        };
    }
}
