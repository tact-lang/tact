struct Inner { 
    nested: Int;
}

struct Mid {
    inner: Inner;
}

struct Top {
    mid: Mid;
}

contract MultiDepthTest {
    state: Top;

    init() {
        self.state = Top{ mid: Mid{ inner: Inner{ nested: 42 } } };
    }
}