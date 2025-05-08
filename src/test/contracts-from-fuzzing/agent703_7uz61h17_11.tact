struct ComposeA {
    i: Int;
    b: Bool;
}

struct ComposeB {
    str: String;
    inner: ComposeA;
}

contract StructCompositionTest {
    cmp: ComposeB;

    init() {
        self.cmp = ComposeB{
            str: "Compose",
            inner: ComposeA{
                i: 100,
                b: false
            }
        };
    }
}