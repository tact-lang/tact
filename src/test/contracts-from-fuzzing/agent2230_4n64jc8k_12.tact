struct InnerA { a: Int; b: Bool; }
struct InnerB { c: String; d: Slice; }

struct MidLevel {
    x: InnerA;
    y: InnerB;
}

contract MidNested {
    persist: MidLevel;

    init() {
        self.persist = MidLevel{
            x: InnerA{ a: 42, b: true },
            y: InnerB{ c: "nested", d: emptyCell().asSlice() }
        };
    }
}