struct Mid1 { x: Int; y: Bool }
struct Mid2 { s: String; z: Address }
struct Mid3 { c: Cell; sl: Slice }

struct TopCombo {
    m1: Mid1;
    m2: Mid2;
    m3: Mid3;
}

contract CombineNested {
    combo: TopCombo;

    init() {
        self.combo = TopCombo{
            m1: Mid1{ x:1, y:true },
            m2: Mid2{ s:"s", z:myAddress() },
            m3: Mid3{ c:emptyCell(), sl:emptyCell().asSlice() }
        };
    }
}