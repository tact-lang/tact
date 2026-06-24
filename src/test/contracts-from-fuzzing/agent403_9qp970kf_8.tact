struct ChainA { x: Int }
struct ChainB { a: ChainA; y: Bool }
struct ChainC { b: ChainB; z: String }

contract TestContract {
    c: ChainC;

    init() {
        self.c = ChainC{
            b: ChainB{
                a: ChainA{ x: 5 },
                y: true
            },
            z: "ok"
        };
    }
}
