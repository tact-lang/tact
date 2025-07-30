struct LargeNested1 {
    a: Int;
    b: LargeNested2;
}

struct LargeNested2 {
    c: Int?;
    d: LargeNested3;
}

struct LargeNested3 {
    e: Bool;
    f: LargeNested4;
}

struct LargeNested4 {
    g: String;
    h: Bool?;
}

contract Test {
    nested: LargeNested1;

    init() {
        self.nested = LargeNested1{
            a:1,
            b:LargeNested2{
                c:null,
                d:LargeNested3{
                    e:true,
                    f:LargeNested4{
                        g:"text",
                        h:null
                    }
                }
            }
        };
    }
}