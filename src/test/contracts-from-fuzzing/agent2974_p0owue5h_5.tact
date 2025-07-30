struct DeeplyNested {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: DeeplyNested;
    flag: Bool;
}

struct OuterMost {
    m: Middle;
    num: Int;
}

contract TestContract {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            m: Middle{
                inner: DeeplyNested{a: 5, b: false},
                flag: true
            },
            num: 123
        };
    }
}