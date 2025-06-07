struct Alpha {
    a: Int;
}

struct Beta {
    b: Bool;
}

contract TestContract {
    alphaField: Alpha;
    betaField: Beta;

    init() {
        self.alphaField = Alpha{ a: 5 };
        self.betaField = Beta{ b: true };
    }
}