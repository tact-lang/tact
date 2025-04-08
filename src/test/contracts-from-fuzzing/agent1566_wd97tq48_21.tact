struct Inner1 {
    x: Int;
    y: Bool;
}

struct Inner2 {
    z: String;
    w: Cell;
}

struct Combo {
    a: Inner1;
    b: Inner2;
}

contract MixedNested {
    s: Combo;

    init() {
        self.s = Combo{
            a: Inner1{ x:1, y:true },
            b: Inner2{ z:"z", w:emptyCell() },
        };
    }
}
