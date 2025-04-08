struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    i: Inner;
    j: Int;
}

contract NestedStructContract {
    data: Outer;

    init() {
        self.data = Outer{
            i: Inner{ a: 10, b: false },
            j: 20,
        };
    }
}