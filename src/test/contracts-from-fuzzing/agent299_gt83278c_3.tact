struct Inner {
    x: Int = 0;
    y: Bool?;
}

struct Outer {
    a: Int;
    b: Inner;
}

contract TestContract {
    st: Outer;

    init() {
        self.st = Outer{
            a: 10,
            b: Inner{
                x: 5,
                y: true
            }
        };
    }
}