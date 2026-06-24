struct ChainA { a: Int }
struct ChainB { b: ChainA }
struct ChainC { c: ChainB }
struct ChainD { d: ChainC }

contract TestContract {
    field1: ChainD;
    field2: ChainC;
    field3: ChainB;
    field4: ChainA;

    init() {
        self.field1 = ChainD { d: ChainC { c: ChainB { b: ChainA { a: 1 } } } };
        self.field2 = ChainC { c: ChainB { b: ChainA { a: 2 } } };
        self.field3 = ChainB { b: ChainA { a: 3 } };
        self.field4 = ChainA { a: 4 };
    }
}