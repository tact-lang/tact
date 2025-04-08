struct DeepOptionalInner {
    x: Int?;
}

struct DeepOptionalMid {
    inner: DeepOptionalInner?;
}

struct DeepOptionalTop {
    mid: DeepOptionalMid?;
}

contract DeepOptionTest {
    data: DeepOptionalTop?;

    init() {
        self.data = null;
    }
}