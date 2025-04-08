struct Inner {
    a: Int = 5;
    b: Int = 6;
}

contract Test {
    o: Inner?;

    init() {
        self.o = null;
    }
}