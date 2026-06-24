struct Base1 { a: Int; }
struct Base2 { b: Bool; }

struct Nested1 { x: Base1; }
struct Nested2 { y: Base2; }

struct Combo {
    nest1: Nested1;
    nest2: Nested2;
    flag: Bool;
}

contract Test {
    combo: Combo;

    init() {
        self.combo = Combo{
            nest1: Nested1{ x: Base1{ a: 7 } },
            nest2: Nested2{ y: Base2{ b: true } },
            flag: false,
        };
    }
}