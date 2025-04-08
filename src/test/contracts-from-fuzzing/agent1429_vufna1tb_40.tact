struct Comb1 {
    a: Int; b: Bool; c: String;
}

struct Comb2 {
    a: Int?; b: Bool?; c: String?;
}

contract MixNested {
    f1: Comb1;
    f2: Comb2;

    init() {
        self.f1 = Comb1{ a: 1, b: true, c: "abc" };
        self.f2 = Comb2{ a: null, b: false, c: "x" };
    }
}
