struct StructA {
    foo: Int;
    bar: Bool;
}

struct StructB {
    s: StructA;
    desc: String;
}

struct StructC {
    inner: StructB;
    num: Int?;
}

contract MultiNest {
    data: StructC;

    init() {
        self.data = StructC{
            inner: StructB{
                s: StructA{
                    foo: 5,
                    bar: true,
                },
                desc: "hi",
            },
            num: 7,
        };
    }
}
