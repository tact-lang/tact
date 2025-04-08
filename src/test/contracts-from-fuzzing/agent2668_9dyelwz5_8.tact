struct InnerMost { s: String; b: Bool; }
struct Middle { inn: InnerMost; c: Cell; }
struct OuterMost { mid: Middle; sl: Slice; }

contract NestedPrimitiveTest {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            mid: Middle{ inn: InnerMost{ s: "abc", b:true }, c: emptyCell() },
            sl: emptyCell().asSlice()
        };
    }
}
