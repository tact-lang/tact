struct Inner1 {
    value: Int;
}

struct Inner2 {
    inner: Inner1;
}

struct Inner3 {
    inner: Inner2;
}

contract MultipleNested {
    field: Inner3;

    init() {
        self.field = Inner3{
            inner: Inner2{
                inner: Inner1{
                    value: 42,
                },
            },
        };
    }
}
