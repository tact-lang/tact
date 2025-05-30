struct Flags {
    enabled: Bool;
    ready: Bool;
}

contract ManyBools {
    f1: Bool = true;
    f2: Bool = false;
    f3: Bool = true;
    f4: Bool = false;
    f5: Bool = true;
    inner: Flags = Flags{enabled: true, ready: false};

    init() {
        self.inner.ready = true;
        self.f4 = true;
    }
}
