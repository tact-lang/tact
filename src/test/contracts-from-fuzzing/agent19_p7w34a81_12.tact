struct DataA { a: Int; }
struct DataB { b: Bool; }
struct DataC { c: String; }

struct Combo {
    aPart: DataA;
    bPart: DataB;
    cPart: DataC;
}

contract CompositeParts {
    combined: Combo;

    init() {
        self.combined = Combo{
            aPart: DataA{ a: 1 },
            bPart: DataB{ b: false },
            cPart: DataC{ c: "zzz" },
        };
    }
}