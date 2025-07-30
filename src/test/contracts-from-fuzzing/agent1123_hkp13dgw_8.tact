struct V {
    val: Int;
}

struct U {
    v: V;
}

struct T {
    u: U;
}

contract DeepChain {
    x: T;

    init() {
        self.x = T{
            u: U{
                v: V{
                    val: 42
                }
            }
        };
    }
}