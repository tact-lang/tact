struct Ints {
    a: Int = 0;
    b: Int = 1;
    c: Int = -1;
    d: Int = 999;
    e: Int = -999;
}

contract DefaultedIntsTest {
    data: Ints;

    init() {
        self.data = Ints {};
    }
}