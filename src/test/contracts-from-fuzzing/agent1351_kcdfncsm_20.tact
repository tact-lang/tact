struct BoolLayer1 { b: Bool }
struct BoolLayer2 { l1: BoolLayer1 }
struct BoolLayer3 { l2: BoolLayer2 }
struct BoolLayer4 { l3: BoolLayer3 }

contract BoolDeep {
    nestedBool: BoolLayer4;

    init() {
        self.nestedBool = BoolLayer4{
            l3: BoolLayer3{
                l2: BoolLayer2{
                    l1: BoolLayer1{ b: true }
                }
            }
        };
    }
}