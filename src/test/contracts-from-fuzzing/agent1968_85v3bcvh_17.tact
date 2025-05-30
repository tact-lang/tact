struct ComposeA { x: Int; }
struct ComposeB { a: ComposeA; y: Int; }
struct ComposeC { b: ComposeB; z: Int; }

contract Test18 {
    data: ComposeC;
    init() {
        self.data = ComposeC{
            b: ComposeB{
                a: ComposeA{x:5},
                y:10
            },
            z:15
        };
    }
}