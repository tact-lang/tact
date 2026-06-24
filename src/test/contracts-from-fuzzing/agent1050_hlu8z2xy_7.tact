struct Inner {
    f: String?;
}

struct Outer {
    a: Int;
    b: Bool;
    c: Inner;
}

contract MultiStruct {
    data: Outer;

    init() {
        self.data = Outer{
            a: 11,
            b: true,
            c: Inner{ f: "hello" },
        };
    }
}
