struct Alpha {
    a: Int?;
    b: Bool;
}

struct Beta {
    c: String?;
    d: Int;
}

contract TestContract {
    alphaData: Alpha;
    betaData: Beta;

    init() {
        self.alphaData = Alpha{ a: null, b: true };
        self.betaData = Beta{ c: "hi", d: 5 };
    }
}