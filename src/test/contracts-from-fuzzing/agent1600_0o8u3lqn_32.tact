struct RemA {
    rem: Slice as remaining;
}

struct RemB {
    rem: Slice as remaining;
}

struct CombineRems {
    a: RemA;
    b: RemB;
}

contract MultiRemainingNest {
    d: CombineRems;

    init() {
        self.d = CombineRems{
            a: RemA{rem: emptyCell().asSlice()},
            b: RemB{rem: emptyCell().asSlice()}
        };
    }
}