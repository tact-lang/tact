struct DeeplyNested {
    a: L1;
}
struct L1 {
    b: L2;
}
struct L2 {
    c: L3;
}
struct L3 {
    d: L4;
}
struct L4 {
    e: String;
    f: Bool;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract VeryDeepStruct {
    x: DeeplyNested;

    init() {
        self.x = DeeplyNested{
            a: L1{
                b: L2{
                    c: L3{
                        d: L4{
                            e: "hello",
                            f: true,
                            g: null,
                            h: false,
                            i: null,
                        },
                    },
                },
            },
        };
    }
}
