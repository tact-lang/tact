struct Ab {
    a: Int;
    b: Bool;
}

struct Cd {
    c: String;
    d: Address;
}

struct Ef {
    e: Cell;
    f: Slice;
}

struct Combo {
    ab: Ab;
    cd: Cd;
    ef: Ef;
}

contract DeepNested {
    combo: Combo;

    init() {
        self.combo = Combo{
            ab: Ab{ a: 5, b: true },
            cd: Cd{ c: "hi", d: myAddress() },
            ef: Ef{ e: emptyCell(), f: emptyCell().asSlice() },
        };
    }
}