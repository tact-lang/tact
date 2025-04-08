struct MultiLevel {
    one: Int;
    two: Sub1;
    three: Sub2;
}

struct Sub1 {
    a: Int;
    b: Int?;
}

struct Sub2 {
    c: Bool;
    d: String?;
}

contract Test6 {
    ml: MultiLevel;

    init() {
        self.ml = MultiLevel{
            one: 1,
            two: Sub1{ a: 2, b: null },
            three: Sub2{ c: false, d: null }
        };
    }
}