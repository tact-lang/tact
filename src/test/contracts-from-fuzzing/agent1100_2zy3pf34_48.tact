struct Inner1 { a: Int; }
struct Inner2 { b: Int; }

struct Combo {
    x: Inner1;
    y: Inner2;
    z: Int;
}

contract MultiInnerStruct {
    data: Combo;
    init() {
        self.data = Combo{
            x: Inner1{a: 1},
            y: Inner2{b: 2},
            z: 3
        };
    }
}
