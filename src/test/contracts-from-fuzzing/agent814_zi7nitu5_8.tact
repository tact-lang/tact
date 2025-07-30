struct Inner {
    a: Int = 5;
    b: Bool?;
}

struct Outer {
    foo: Inner;
    bar: Int;
}

contract TestContract {
    myState: Outer;

    init() {
        self.myState = Outer{
            foo: Inner{ a: 12, b: null },
            bar: 99
        };
    }
}