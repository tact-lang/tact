struct DeepInner {
    x: Int;
}

struct Middle {
    di: DeepInner;
    s: String;
}

struct Outer {
    m: Middle;
    b: Bool;
}

contract DeepNestedStruct {
    s: Outer;

    init() {
        self.s = Outer{
            m: Middle{
                di: DeepInner{
                    x: 5
                },
                s: "inner"
            },
            b: false
        };
    }
}