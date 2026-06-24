struct InnerMost {
    v1: Int;
    v2: String?;
}

struct Middle {
    inner: InnerMost;
    flag: Bool;
}

struct Outer {
    count: Int;
    detail: Middle;
}

contract DeeplyNestedMany {
    data: Outer;

    init() {
        self.data = Outer{
            count: 5,
            detail: Middle{
                inner: InnerMost{
                    v1: 10,
                    v2: null,
                },
                flag: true,
            }
        };
    }
}
