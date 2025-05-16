contract EmptyStructsTest {
    s: Empty;

    init() {
        self.s = Empty{a:1};
    }
}

struct Empty {
    a: Int;
}
