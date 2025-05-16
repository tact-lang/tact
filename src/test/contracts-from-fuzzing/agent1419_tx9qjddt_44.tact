struct InnerMost {
    v: Int;
    flag: Bool?;
}

struct MidInner {
    nested: InnerMost;
    comment: String?;
}

struct Outer {
    container: MidInner;
    valid: Bool;
}

contract DeepOptionNestedTest {
    data: Outer;
    init() {
        self.data = Outer{
            container: MidInner{
                nested: InnerMost{
                    v: 123,
                    flag: null
                },
                comment: null
            },
            valid: true
        };
    }
}