struct InnerMost {
    a: Int;
    b: Int?;
}

struct MidLevel {
    x: InnerMost;
    y: InnerMost;
}

struct Outer {
    foo: MidLevel;
    bar: MidLevel;
}

contract C {
    data: Outer;

    init() {
        self.data = Outer{
            foo: MidLevel{
                x: InnerMost{a:1,b:null},
                y: InnerMost{a:2,b:null}
            },
            bar: MidLevel{
                x: InnerMost{a:3,b:null},
                y: InnerMost{a:4,b:null}
            }
        };
    }
}