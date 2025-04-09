struct InnerMost {
    x: Int;
}

struct Inner {
    a: InnerMost;
    b: InnerMost;
    c: InnerMost;
}

struct Outer {
    first: Inner;
    second: Inner;
    third: Inner;
}

contract WideDeep 
{
    nested: Outer;

    init() {
        self.nested = Outer{
            first: Inner{
                a: InnerMost{ x:1 }, b: InnerMost{ x:2 }, c: InnerMost{ x:3 }
            },
            second: Inner{
                a: InnerMost{ x:4 }, b: InnerMost{ x:5 }, c: InnerMost{ x:6 }
            },
            third: Inner{
                a: InnerMost{ x:7 }, b: InnerMost{ x:8 }, c: InnerMost{ x:9 }
            }
        };
    }
}
