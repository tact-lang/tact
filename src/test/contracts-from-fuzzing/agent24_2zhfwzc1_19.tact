struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
}

struct Wrapper {
    nested: BigNested;
    status: Bool;
}

contract NestedBigStructTest {
    store: Wrapper;

    init() {
        self.store = Wrapper{
            nested: BigNested{
                a: 1,
                b: true,
                c: "A",
                d: 2,
                e: false,
                f: "B"
            },
            status: true
        };
    }
}