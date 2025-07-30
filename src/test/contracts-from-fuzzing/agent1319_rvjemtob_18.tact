struct InnerL {
    x: Int;
}

struct MiddleL {
    y: InnerL;
}

struct OuterL {
    z: MiddleL;
}

contract NestedAssignTest {
    v: OuterL;

    init() {
        self.v = OuterL {
            z: MiddleL {
                y: InnerL {
                    x: 42
                }
            }
        };
    }
}