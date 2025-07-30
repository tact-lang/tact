struct BigNested {
    field1: Inner1;
    field2: Inner2;
}

struct Inner1 {
    x: Int;
    y: Bool?;
}

struct Inner2 {
    s: String;
    addr: Address?;
}

contract NestedComplex {
    data: BigNested;

    init() {
        self.data = BigNested{
            field1: Inner1{ x: 5, y: true },
            field2: Inner2{ s: "foo", addr: null },
        };
    }
}
