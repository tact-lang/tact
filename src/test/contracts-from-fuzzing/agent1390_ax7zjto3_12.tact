struct Inner {
    x: Int;
}

struct Middle {
    y: Inner;
}

struct Outer {
    z: Middle;
}

contract DeepChain {
    chain: Outer;

    init() {
        self.chain = Outer{
            z: Middle{
                y: Inner{
                    x: 123
                }
            }
        };
    }
}
