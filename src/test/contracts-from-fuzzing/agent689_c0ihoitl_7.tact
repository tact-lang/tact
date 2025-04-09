struct Deep {
    n1: Int;
    n2: Inner2;
}

struct Inner2 {
    m1: BoolWrap;
    m2: BoolWrap?;
}

struct BoolWrap {
    value: Bool;
}

contract DeepStructTest {
    data: Deep;

    init() {
        self.data = Deep{
            n1: 7,
            n2: Inner2{
                m1: BoolWrap{ value: true },
                m2: null,
            },
        };
    }
}