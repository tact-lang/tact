struct Sub1 { x: Int; }
struct Sub2 { y: Bool; }

struct Holder {
    f1: Sub1;
    f2: Sub2;
}

contract MultiTypeNested {
    nested: Holder;

    init() {
        self.nested = Holder{
            f1: Sub1{ x: 4 },
            f2: Sub2{ y: true }
        };
    }
}