struct DeepNested {
    a: Int;
    b: InnerLevel1;
}

struct InnerLevel1 {
    c: Bool;
    d: InnerLevel2?;
}

struct InnerLevel2 {
    e: String;
    f: InnerLevel3;
}

struct InnerLevel3 {
    g: String;
    h: Int?;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            a: 1,
            b: InnerLevel1{
                c: true,
                d: InnerLevel2{
                    e: "hello",
                    f: InnerLevel3{
                        g: "world",
                        h: 42
                    }
                }
            }
        };
    }
}