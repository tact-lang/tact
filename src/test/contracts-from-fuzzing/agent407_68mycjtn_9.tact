struct NestedSeq1 { x: Int; }
struct NestedSeq2 { y: NestedSeq1; }
struct NestedSeq3 { z: NestedSeq2; }
struct NestedSeq4 { w: NestedSeq3; }

contract Chain {
    ch: NestedSeq4;
    init() {
        self.ch = NestedSeq4{
            w: NestedSeq3{
                z: NestedSeq2{
                    y: NestedSeq1{ x: 123 }
                }
            }
        };
    }
}
