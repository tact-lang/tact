struct Inner {
    flag: Bool;
    content: String?;
}

contract LargeData {
    i1: Inner;
    i2: Inner;
    i3: Inner;
    i4: Inner;

    init() {
        self.i1 = Inner{ flag: true, content: null };
        self.i2 = Inner{ flag: true, content: null };
        self.i3 = Inner{ flag: true, content: null };
        self.i4 = Inner{ flag: true, content: null };
    }
}