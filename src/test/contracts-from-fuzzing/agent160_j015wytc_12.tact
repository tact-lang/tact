struct BigNested {
    a: Int;
    b: Bool;
    c: SubSub;
}

struct SubSub {
    d: Int;
    e: InnerMost;
}

struct InnerMost {
    f: Bool;
    g: String;
}

contract DeepNest {
    data: BigNested;
    init() {
        self.data = BigNested{
            a:1,
            b:true,
            c: SubSub{
                d: 2,
                e: InnerMost{
                    f: false,
                    g: "hi"
                }
            }
        };
    }
}