struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    p: Int;
    q: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            p: 42,
            q: Inner{
                x: 7,
                y: true
            }
        };
    }
}