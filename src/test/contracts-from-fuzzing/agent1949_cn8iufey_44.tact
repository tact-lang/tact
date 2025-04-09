struct X {
    a: Int;
}

contract OptionalXTest {
    ox: X?;

    init() {
        self.ox = null;
    }
}
