struct InnerMost {
    flag: Bool;
    value: Int?;
}

struct Middle {
    inner: InnerMost;
    num: Int;
}

struct Outer {
    m: Middle;
    b: Bool;
}

contract DeepContract {
    deep: Outer;

    init() {
        self.deep = Outer{
            m: Middle{
                inner: InnerMost{ flag: true, value: null },
                num: 123
            },
            b: false
        };
    }
}
