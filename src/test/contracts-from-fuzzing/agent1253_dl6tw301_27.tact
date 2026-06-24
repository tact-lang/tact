struct DeepInner {
    val: Int?;
}

struct DeepMiddle {
    mid: DeepInner?;
}

struct DeepOuter {
    out: DeepMiddle?;
}

contract DeepOpts {
    data: DeepOuter;

    init() {
        self.data = DeepOuter{ out: DeepMiddle{ mid: DeepInner{ val: null } } };
    }

    receive() {}
}