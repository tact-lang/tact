struct A { n: Int; }
struct B { n: Int; }
struct Both {
    a: A;
    b: B;
    flag: Bool;
}

contract SideBySide {
    nested: Both;

    init() {
        self.nested = Both{
            a: A{n: 1},
            b: B{n: 2},
            flag: true,
        };
    }
}