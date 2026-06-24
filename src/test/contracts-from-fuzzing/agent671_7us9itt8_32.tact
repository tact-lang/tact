struct Inner {
    x: Int as int4 = -3;
    y: Bool = true;
}

struct Outer {
    inner: Inner;
    value: Int as uint5 = 16;
    comment: String = "test";
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{
            inner: Inner{},
            value: 5,
            comment: "hello"
        };
    }
}