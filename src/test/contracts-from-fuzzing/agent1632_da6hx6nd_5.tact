struct Wrapper {
    inner: Inner;
}

struct Inner {
    value: Int;
}

contract MultipleFields {
    field1: Wrapper;
    field2: Wrapper;
    field3: Wrapper;

    init() {
        self.field1 = Wrapper{ inner: Inner{ value: 1 } };
        self.field2 = Wrapper{ inner: Inner{ value: 2 } };
        self.field3 = Wrapper{ inner: Inner{ value: 3 } };
    }
}