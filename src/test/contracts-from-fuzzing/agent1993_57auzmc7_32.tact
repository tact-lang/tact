struct Inner {
    i: Int; s: String;
}

contract BothOptMix {
    o: Inner?;

    init() {
        self.o = null;
    }
}