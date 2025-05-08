contract OptionalStructsCombined {
    o1: Inner?;
    o2: Inner?;

    init() {
        self.o1 = null;
        self.o2 = Inner{ x:5, y:false };
    }
}

struct Inner {
    x: Int;
    y: Bool;
}
