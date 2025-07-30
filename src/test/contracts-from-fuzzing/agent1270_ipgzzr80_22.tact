struct InnerA { a: Int }
struct InnerB { b: Bool }
struct Both {
    ina: InnerA;
    inb: InnerB;
}

contract TestContract {
    compound: Both;

    init() {
        self.compound = Both{
            ina: InnerA{a: 9},
            inb: InnerB{b:true}
        };
    }
}