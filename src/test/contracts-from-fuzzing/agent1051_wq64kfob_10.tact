struct ComposeA {
    x: Int;
    y: Bool;
}

struct ComposeB {
    a: ComposeA;
    s: String;
}

struct ComposeC {
    b: ComposeB;
    c: Cell;
}

contract ComposeTest {
    state: ComposeC;

    init() {
        self.state = ComposeC{
            b: ComposeB{
                a: ComposeA{x: 7, y: true},
                s: "hi"
            },
            c: emptyCell()
        };
    }
}