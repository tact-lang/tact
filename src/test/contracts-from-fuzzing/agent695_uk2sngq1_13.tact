struct AB {
    a: Int;
    b: Int;
}

struct CD {
    c: Int;
    d: Int;
}

struct ABCD {
    ab: AB;
    cd: CD;
}

contract DoubleNested {
    x: ABCD;

    init() {
        self.x = ABCD{
            ab: AB{a:1,b:2},
            cd: CD{c:3,d:4},
        };
    }
}