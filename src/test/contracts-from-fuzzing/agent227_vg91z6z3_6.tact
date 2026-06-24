struct Inner {
    x: Int;
    y: String?;
}

struct Outer {
    in1: Inner;
    in2: Inner;
    flag: Bool;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            in1: Inner{ x: 10, y: null },
            in2: Inner{ x: -5, y: "hello" },
            flag: true,
        };
    }

    receive() {
        let _ = self.data.in2.y;
    }
}
