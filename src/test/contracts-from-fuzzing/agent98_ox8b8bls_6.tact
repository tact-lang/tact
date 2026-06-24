struct Inner {
    x: Int;
    y: Bool?;
}

struct Middle {
    i: Inner;
    z: String?;
}

struct Outer {
    m: Middle?;
    count: Int;
}

contract OptInStruct {
    state: Outer;

    init() {
        self.state = Outer{
            m: Middle{
                i: Inner{ x: 42, y: null },
                z: null
            },
            count: 0
        };
    }
}