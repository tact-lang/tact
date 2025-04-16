struct Inner {
    z: Int;
}

struct Mid {
    y: Inner;
}

contract DeepOverwrite {
    field: Mid;
    init() {
        self.field = Mid{ y: Inner{z: 1} };
        self.field = Mid{ y: Inner{z: 2} };
    }
}