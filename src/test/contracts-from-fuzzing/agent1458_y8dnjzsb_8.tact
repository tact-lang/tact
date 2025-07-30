struct Alpha {
    val: Int;
}

struct Beta {
    flag: Bool;
}

struct Gamma {
    addr: Address;
}

struct Combo {
    one: Alpha;
    two: Beta;
    three: Gamma;
}

contract Test {
    data: Combo;

    init() {
        self.data = Combo{
            one: Alpha{ val: 123 },
            two: Beta{ flag: true },
            three: Gamma{ addr: myAddress() },
        };
    }
}