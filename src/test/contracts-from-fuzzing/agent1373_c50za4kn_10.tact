struct LeafA { val: Int; }

struct MidA { leaf: LeafA; }

struct MidB { middle: MidA?; }

contract Test {
    storage: MidB;

    init() {
        self.storage = MidB{
            middle: MidA{
                leaf: LeafA{
                    val: 101
                }
            }
        };
    }
}