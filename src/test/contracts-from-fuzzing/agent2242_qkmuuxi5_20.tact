struct Combo1 {
    a: Int;
    b: Bool;
}
struct Combo2 {
    c: String;
    d: Int?;
}

struct AllTogether {
    first: Combo1;
    second: Combo2;
}

contract DeepCombinations {
    all: AllTogether;

    init() {
        self.all = AllTogether{
            first: Combo1{ a: 10, b: true },
            second: Combo2{ c: "x", d: null }
        };
    }
}