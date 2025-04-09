struct Zero {
    one: Int;
    two: Int;
}

struct One {
    zero: Zero;
}

struct Two {
    one: One;
}

struct Three {
    two: Two;
}

contract DeepChain {
    data: Three;
    init() {
        self.data = Three{
            two: Two{ one: One{ zero: Zero{ one:1, two:2 } } }
        };
    }
}