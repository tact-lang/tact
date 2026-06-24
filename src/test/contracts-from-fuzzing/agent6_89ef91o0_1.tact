struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    in1: Inner;
    in2: Inner;
    flag: Bool;
    msg: String;
}

contract TestContract {
    data: Outer;
    count: Int = 0;

    init() {
        self.data = Outer{
            in1: Inner{ x:1, y:2 },
            in2: Inner{ x:3, y:4 },
            flag: true,
            msg: "text"
        };
    }
}
