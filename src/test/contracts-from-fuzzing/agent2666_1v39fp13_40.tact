struct NestedA {
    x: Int;
}

struct NestedB {
    y: NestedA;
}

struct NestedC {
    z: NestedB;
}

contract DeepNesting {
    val: NestedC;

    init() {
        self.val = NestedC{
            z: NestedB{
                y: NestedA{
                    x: 555
                }
            }
        };
    }
}