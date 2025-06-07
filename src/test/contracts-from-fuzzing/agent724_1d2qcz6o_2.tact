struct Inner {
    val: Int;
}

struct Outer {
    a: Int;
    b: Inner;
    c: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            a: 5,
            b: Inner{val: 10},
            c: null
        };
    }
}