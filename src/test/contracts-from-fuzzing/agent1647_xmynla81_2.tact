struct Inner {
    foo: Int?;
    flag: Bool?;
}

struct Outer {
    s: String?;
    addr: Address?;
    nested: Inner?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            s: "hello",
            addr: null,
            nested: Inner{foo: 1, flag: true}
        };
    }
}
