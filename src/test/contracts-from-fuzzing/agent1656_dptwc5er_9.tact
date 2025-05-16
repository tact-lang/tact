struct ChainA {
    fa: Int;
    fb: ChainB;
}

struct ChainB {
    x: Bool;
    y: ChainC;
}

struct ChainC {
    foo: String;
}

contract NestedChainTest {
    data: ChainA;

    init() {
        self.data = ChainA{
            fa: 9,
            fb: ChainB{
                x: true,
                y: ChainC{
                    foo: "bar"
                }
            }
        };
    }
}
