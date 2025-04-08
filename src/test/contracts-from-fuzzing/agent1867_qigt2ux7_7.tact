struct Inner {
    flag: Bool;
    amount: Int;
}

struct Outer {
    inner: Inner;
    maybeInner: Inner?;
    anotherInt: Int;
}

contract OptionalStructTest {
    data: Outer;
    init() {
        self.data = Outer{
            inner: Inner{flag:true, amount:1},
            maybeInner: null,
            anotherInt: 2
        };
    }
}