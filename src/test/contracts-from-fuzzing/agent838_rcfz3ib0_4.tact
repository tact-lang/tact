struct InnerMost {
    flag: Bool;
}

struct Inner {
    i: Int;
    im: InnerMost;
}

struct Outer {
    s: String;
    inn: Inner;
}

contract DeeplyNestedStruct {
    data: Outer;

    init() {
        self.data = Outer{
            s: "hello",
            inn: Inner{
                i: 0,
                im: InnerMost{
                    flag: true
                }
            }
        };
    }
}