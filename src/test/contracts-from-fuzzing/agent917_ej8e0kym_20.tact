struct FlatA { x: Int; y: Bool; }
struct FlatB { z: String; }

struct Combined {
    a: FlatA;
    b: FlatB;
    c: Int;
    d: Bool;
    e: String;
}

contract Combiner {
    data: Combined;

    init() {
        self.data = Combined{
            a: FlatA{ x: 1, y: true },
            b: FlatB{ z: "lol" },
            c: 5,
            d: false,
            e: "foo"
        };
    }
}