struct Outer {
    inn: Inner;
}

struct Inner {
    v: Int as uint8;
}

contract OutOfRangeTest {
    state: Outer;
    init() {
        self.state = Outer{
            inn: Inner {
                v: 300
            }
        };
    }
}