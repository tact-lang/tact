struct InnerMost {
    x: Int;
    y: Bool;
}

struct Middle {
    inner: InnerMost;
    opt: String?;
}

struct Outer {
    mid: Middle;
    val: Int;
}

contract ThreeLevel {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: InnerMost{
                    x: 1,
                    y: true,
                },
                opt: null,
            },
            val: 99,
        };
    }
}