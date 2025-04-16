struct Inner {
    flag: Bool;
    note: String?;
}

struct Middle {
    a: Int;
    b: Inner;
    c: Int?;
}

struct Outer {
    payload: Middle;
    extra: Bool?;
    description: String;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            payload: Middle{
                a: 10,
                b: Inner{ flag: true, note: null },
                c: 42
            },
            extra: false,
            description: "desc"
        };
    }

    receive() {
        let _ = self.data.payload.b.flag;
    }
}