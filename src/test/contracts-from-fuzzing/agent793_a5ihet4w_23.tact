struct AB {
    a: Int;
    b: Int;
}

struct ABCD {
    ab: AB;
    cd: AB;
}

contract TestContract {
    compound: ABCD;

    init() {
        self.compound = ABCD{
            ab: AB{a:1,b:2},
            cd: AB{a:3,b:4}
        };
    }

    receive() {}
}