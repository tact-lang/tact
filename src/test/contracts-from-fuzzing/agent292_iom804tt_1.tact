struct Deep {
    inner: Inner;
}

struct Inner {
    value: Int;
}

contract NestTest {
    field: Deep;

    init() {
        self.field = Deep{ inner: Inner{ value: 7 } };
    }
}