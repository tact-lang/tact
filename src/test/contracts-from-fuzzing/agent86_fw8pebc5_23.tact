struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    a: Inner?;
    b: Inner;
}

contract C {
    data: Outer;

    init() {
        self.data = Outer{
            a: null,
            b: Inner{
                x: 1,
                y: null,
            }
        };
    }
}