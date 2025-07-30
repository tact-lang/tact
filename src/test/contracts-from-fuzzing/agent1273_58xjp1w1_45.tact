struct Bottom {
    deepVal: Int;
}

struct Mid {
    inner: Bottom;
}

struct Top {
    wrapped: Mid;
}

contract ThreeLayers {
    data: Top;

    init() {
        self.data = Top{wrapped: Mid{inner: Bottom{deepVal:77}}};
    }
}