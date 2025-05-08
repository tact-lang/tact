struct Deep {
    aa: Int;
    bb: Bool?;
    cc: String;
}

struct Middle {
    d: Int;
    e: Deep;
    f: Bool;
}

struct Outer {
    x: Int;
    y: Middle;
    z: Bool;
}

contract TestDeepNested {
    field: Outer;
    init() {
        self.field = Outer{
            x: 5,
            y: Middle{
                d: 7,
                e: Deep{
                    aa: 9,
                    bb: null,
                    cc: "hello",
                },
                f: true,
            },
            z: false,
        };
    }
}