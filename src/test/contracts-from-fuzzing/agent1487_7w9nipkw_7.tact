struct InnerMost { x: Int; }
struct Mid1 { im: InnerMost; y: Int; }
struct Mid2 { im: InnerMost; z: Int; }

struct Top {
    part1: Mid1;
    part2: Mid2;
    f: Bool;
}

contract ComplexNested {
    val: Top;

    init() {
        self.val = Top{
            part1: Mid1{ im: InnerMost{ x: 1 }, y: 2 },
            part2: Mid2{ im: InnerMost{ x: 3 }, z: 4 },
            f: true
        };
    }
}