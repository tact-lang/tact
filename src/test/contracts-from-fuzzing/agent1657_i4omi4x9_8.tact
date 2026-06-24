struct NestedStruct {
    a: Int;
    b: Middle;
}

struct Middle {
    c: Int;
    d: Inner;
}

struct Inner {
    e: Int;
    f: String;
}

contract Test {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{
            a:1,
            b: Middle{
                c:2,
                d: Inner{
                    e:3,
                    f:"hi"
                }
            }
        };
    }
}