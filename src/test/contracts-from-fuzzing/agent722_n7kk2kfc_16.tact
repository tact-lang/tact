struct Part1 { a: Int; b: Bool; }
struct Part2 { x: String; y: Cell; }
struct Whole {
    p1: Part1;
    p2: Part2;
}

contract NestedParts {
    big: Whole;

    init() {
        self.big = Whole{
            p1: Part1{ a:1, b: true },
            p2: Part2{ x: "x", y: emptyCell() },
        };
    }
}