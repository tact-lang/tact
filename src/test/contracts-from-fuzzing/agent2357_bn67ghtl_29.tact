struct Zero {
    z: Int;
}
struct One {
    o: Zero;
}
struct Two {
    t: One;
}
struct Three {
    h: Two;
}

contract DeepChain {
    val: Three;

    init() {
        self.val = Three{ h: Two{ t: One{ o: Zero{ z: 1 } } } };
    }
}
