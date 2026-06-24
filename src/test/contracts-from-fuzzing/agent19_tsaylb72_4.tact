struct Inner {
    x: Int;
    y: Bool?;
}

struct Middle {
    in1: Inner;
    in2: Inner;
}

struct Outer {
    m: Middle;
    z: String;
}

contract DeepNestPersistence {
    val: Outer;

    init() {
        self.val = Outer{
            m: Middle{
                in1: Inner{ x: 4, y: null },
                in2: Inner{ x: 5, y: true },
            },
            z: "Done",
        };
    }
}
