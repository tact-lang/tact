struct S1 {
    x: Int;
}

struct S2 {
    y: Int;
}

struct Holder {
    s1: S1;
    s2: S2;
}

contract StructOfStructs {
    data: Holder;

    init() {
        self.data = Holder{
            s1: S1{x: 7},
            s2: S2{y: 8}
        };
    }
}