struct Bottom {
    a: Int;
}

struct Middle {
    m1: Bottom;
    m2: Bottom;
    opt: Bottom?;
}

struct Top {
    nested: Middle;
    flag: Bool;
    note: String;
}

contract ThreeLayer {
    data: Top;

    init() {
        self.data = Top{
            nested: Middle{
                m1: Bottom{ a:1 },
                m2: Bottom{ a:2 },
                opt: null,
            },
            flag: true,
            note: "hello",
        };
    }

    receive() {
        let _ = self.data;
    }
}