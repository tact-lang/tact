struct MidNested {
    a: Int;
    b: InnerNested;
}

struct InnerNested {
    c: Int;
    d: DeeperNested;
}

struct DeeperNested {
    e: Int;
    f: Bool?;
}

contract MidNestedContract {
    data: MidNested;

    init() {
        self.data = MidNested{
            a: 7,
            b: InnerNested{
                c: 8,
                d: DeeperNested{
                    e: 9,
                    f: null
                }
            }
        };
    }
}