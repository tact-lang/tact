struct Rec1 {
    a: Int;
    b: Bool;
}

struct Rec2 {
    c: Rec1;
    d: Rec1;
}

contract Test49 {
    pair: Rec2;

    init() {
        self.pair = Rec2 {
            c: Rec1{ a: 11, b: true },
            d: Rec1{ a: 22, b: false }
        };
    }
}
