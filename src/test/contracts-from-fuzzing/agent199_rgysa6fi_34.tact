struct InnerMost { x: Int; }
struct Mid { y: InnerMost; }
struct Outer { z: Mid; }

contract DeepChain {
    chain: Outer;

    init() {
        self.chain = Outer{
            z: Mid{
                y: InnerMost{ x: 100 },
            },
        };
    }
}
