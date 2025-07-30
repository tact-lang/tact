struct StructA {
    i: Int;
    b: Bool;
}

struct StructB {
    s: String;
    sa: StructA;
}

contract MultiNested {
    data: StructB;

    init() {
        self.data = StructB{
            s: "hello",
            sa: StructA{
                i: 42,
                b: true,
            },
        };
    }
}
