struct Group1 { a: Int; b: Bool; }
struct Group2 { c: String; d: Address; }
struct Group3 { e: Slice; f: Cell; }

struct Compose {
    g1: Group1;
    g2: Group2;
    g3: Group3;
}

contract ComposeContract {
    val: Compose;
    init() {
        self.val = Compose{
            g1: Group1{ a: 1, b: true },
            g2: Group2{ c: "text", d: myAddress() },
            g3: Group3{ e: emptyCell().asSlice(), f: emptyCell() }
        };
    }
}