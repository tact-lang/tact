struct Nested {
    addr: Address;
    optInner: Inner?;
}

struct Inner {
    text: String;
    boolean: Bool;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{
            addr: myAddress(),
            optInner: Inner{
                text: "data",
                boolean: true,
            }
        };
    }
}
