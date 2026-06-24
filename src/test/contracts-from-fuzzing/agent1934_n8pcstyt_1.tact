struct Test1 {
    a: Int;
    b: Bool?;
}

struct Test2 {
    c: Int;
    d: Test1;
    e: Bool?;
    f: Int;
}

contract NestedOptionalFields {
    state: Test2;

    init() {
        self.state = Test2{
            c: 123,
            d: Test1{
                a: 5,
                b: null,
            },
            e: false,
            f: 99,
        };
    }
}
