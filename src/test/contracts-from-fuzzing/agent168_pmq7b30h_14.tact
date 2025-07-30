struct AAA {
    a: Int;
    b: Bool;
}

struct BBB {
    c: String;
    d: Int?;
}

struct CCC {
    x: AAA;
    y: BBB;
}

contract ComposedStruct {
    data: CCC;

    init() {
        self.data = CCC{
            x: AAA{
                a: 1,
                b: true,
            },
            y: BBB{
                c: "hi",
                d: null,
            }
        };
    }
}
