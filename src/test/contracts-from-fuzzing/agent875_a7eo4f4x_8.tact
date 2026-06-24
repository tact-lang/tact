struct ComposeA {
    val: Int;
    bfield: ComposeB;
}

struct ComposeB {
    str: String;
    cfield: ComposeC;
}

struct ComposeC {
    flag: Bool?;
}

contract ComposeTest {
    comp: ComposeA;

    init() {
        self.comp = ComposeA{
            val: 999,
            bfield: ComposeB{
                str: "hello",
                cfield: ComposeC{
                    flag: null
                }
            }
        };
    }
}