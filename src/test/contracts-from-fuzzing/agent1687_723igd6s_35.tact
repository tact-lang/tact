struct OptStr {
    s: String?;
}

contract OptStrTest {
    o: OptStr?;

    init() {
        self.o = null;
    }
}