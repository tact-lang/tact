struct DeeplyNested {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct Wrapper1 {
    x: DeeplyNested;
}

struct Wrapper2 {
    y: Wrapper1;
}

struct Wrapper3 {
    z: Wrapper2;
}

contract DeepTest {
    data: Wrapper3;

    init() {
        self.data = Wrapper3{
            z: Wrapper2{
                y: Wrapper1{
                    x: DeeplyNested{
                        a: 1,
                        b: "b",
                        c: false,
                        d: null,
                        e: null,
                        f: null
                    }
                }
            }
        };
    }
}
