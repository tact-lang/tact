struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    a: Inner;
    b: Inner;
}

contract NestedStructContract {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner{x: 1, y: true},
            b: Inner{x: 2, y: null}
        };
    }
}