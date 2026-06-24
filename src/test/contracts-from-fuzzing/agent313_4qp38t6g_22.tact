struct NestedA {
    f: Int;
}
struct NestedB {
    a: NestedA;
}
struct NestedC {
    b: NestedB;
}
struct NestedD {
    c: NestedC;
}

contract DeepChainTest {
    val: NestedD;

    init() {
        self.val = NestedD{
            c: NestedC{
                b: NestedB{
                    a: NestedA{f: 777}
                }
            }
        };
    }
}