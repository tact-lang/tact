struct Inner {
    p: Int as uint4;
    q: Bool?;
}

struct Outer {
    x: Int as int8;
    y: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: -7,
            y: Inner{
                p: 8,
                q: null
            }
        };
    }

    receive() {
        let _ = self.data.y.p;
    }
}