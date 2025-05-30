struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    x: String?;
    y: Inner;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            x: null,
            y: Inner{
                a: 123,
                b: true,
            }
        };
    }
}