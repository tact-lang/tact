struct Inner1 { ii: Int; ss: String; } 
struct Inner2 { ib: Bool; sr: String; }
struct Combo {
    part1: Inner1;
    part2: Inner2;
    flag: Bool;
    comment: String?;
}

contract NestedCombo {
    field: Combo;

    init() {
        self.field = Combo{
            part1: Inner1{ ii: 1, ss: "x" },
            part2: Inner2{ ib: true, sr: "y" },
            flag: false,
            comment: null,
        };
    }
}