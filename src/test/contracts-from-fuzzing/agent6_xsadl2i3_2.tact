struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

contract NestedTest {
    dat: Inner;
    init() {
        self.dat = Inner{
            a: 5,
            b: false,
            c: null,
        };
    }
}