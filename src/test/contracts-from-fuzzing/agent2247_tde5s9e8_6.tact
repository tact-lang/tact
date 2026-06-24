struct DefaultNested {
    inner: Inner;
}

struct Inner {
    val: Int = 7;
    flag: Bool = false;
}

contract DefaultTest {
    s: DefaultNested;

    init() {
        self.s = DefaultNested{
            inner: Inner{}
        };
    }
}
