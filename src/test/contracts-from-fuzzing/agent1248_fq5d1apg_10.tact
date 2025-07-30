struct Inner {
    data: Int?;
}

struct Outer {
    a: Inner;
    b: Inner;
}

contract MultiNullableInner {
    o: Outer;

    init() {
        self.o = Outer{
            a: Inner{data: null},
            b: Inner{data: 99},
        };
    }
}
