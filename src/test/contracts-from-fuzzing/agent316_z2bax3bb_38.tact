struct Bottom {
    marker: Int as uint32;
    suffix: Slice as remaining;
}

struct M1 { nest: Bottom; }
struct M2 { nest: M1; }
struct M3 { nest: M2; }

contract Test {
    nested: M3;

    init() {
        self.nested = M3{
            nest: M2{
                nest: M1{
                    nest: Bottom{
                        marker: 321,
                        suffix: emptyCell().asSlice()
                    }
                }
            }
        };
    }
}
