struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    a: Int;
    b: Inner;
}

contract NestedStructContract {
    data: Outer;

    init() {
        self.data = Outer{
            a: 10,
            b: Inner{
                x: 20,
                y: false,
            },
        };
    }
}