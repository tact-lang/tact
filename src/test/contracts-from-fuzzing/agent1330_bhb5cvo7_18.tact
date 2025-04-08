struct DeepOptional {
    x: Int?;
    inner: Inner?;
}

struct Inner {
    s: String?;
    b: Bool?;
}

contract OptCombo {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            x: null,
            inner: Inner{ s: null, b: null }
        };
    }
}