struct ManyLevels {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
}

struct WrapLevel1 { x: ManyLevels; }
struct WrapLevel2 { x: WrapLevel1; }
struct WrapLevel3 { x: WrapLevel2; }

contract DeepWide {
    s: WrapLevel3;
    init() {
        self.s = WrapLevel3 {
            x: WrapLevel2 {
                x: WrapLevel1 {
                    x: ManyLevels {
                        a: 1, b: true, c: "A", d: myAddress(), e: emptyCell().asSlice(), f: emptyCell()
                    }
                }
            }
        };
    }
}
