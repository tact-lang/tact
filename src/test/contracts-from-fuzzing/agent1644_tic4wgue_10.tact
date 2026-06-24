struct NA {
    i: Int = 10;
}

struct NB {
    a: NA;
}

struct NC {
    b: NB;
}

contract TestContract {
    rec: NC;

    init() {
        self.rec = NC{
            b: NB{ a: NA{ i: 123 } }
        };
    }
}