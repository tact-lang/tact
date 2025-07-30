struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }
struct Combo {
    part1: Inner1;
    part2: Inner2;
    text: String;
    optInt: Int?;
}

contract MultiNestCombo {
    state: Combo;

    init() {
        self.state = Combo{
            part1: Inner1{ a: 1 },
            part2: Inner2{ b: true },
            text: "abc",
            optInt: null
        };
    }
}