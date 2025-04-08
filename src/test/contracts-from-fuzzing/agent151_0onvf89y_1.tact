struct DeeplyNested {
    a: Int;
    b: InnerLevel1;
}

struct InnerLevel1 {
    c: Bool;
    d: InnerLevel2;
}

struct InnerLevel2 {
    e: String;
    f: InnerLevel3?;
}

struct InnerLevel3 {
    g: Bool?;
    h: String;
}

contract TestNested {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            a: 1,
            b: InnerLevel1{
                c: true,
                d: InnerLevel2{
                    e: "ok",
                    f: InnerLevel3{
                        g: false,
                        h: "x"
                    }
                }
            }
        };
    }
}