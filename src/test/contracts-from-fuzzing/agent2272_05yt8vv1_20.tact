struct RecA {
    b: RecB;
}

struct RecB {
    c: RecC;
}

struct RecC {
    done: Bool;
}

contract RecursiveDeep {
    data: RecA;

    init() {
        self.data = RecA{
            b: RecB{ c: RecC{ done:true } }
        };
    }
}