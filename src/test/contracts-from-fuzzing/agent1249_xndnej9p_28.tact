struct A {
    a1: Int;
}

struct B {
    b1: Int;
}

struct Combo {
    fst: A;
    snd: B;
}

contract MultiStructs {
    data: Combo;

    init() {
        self.data = Combo{
            fst: A{a1: 11},
            snd: B{b1: 22}
        };
    }
}