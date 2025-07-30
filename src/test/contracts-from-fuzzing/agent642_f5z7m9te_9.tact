struct NestedStrings {
    s1: String;
    s2: String;
}

struct NestedCells {
    c1: Cell;
    c2: Cell;
}

struct Combination {
    strings: NestedStrings;
    cells: NestedCells;
    num: Int;
    flag: Bool;
}

contract TestContract {
    combined: Combination;
    
    init() {
        self.combined = Combination{
            strings: NestedStrings{ s1: "Hi", s2: "Bye" },
            cells: NestedCells{ c1: emptyCell(), c2: emptyCell() },
            num: 99,
            flag: true
        };
    }
}