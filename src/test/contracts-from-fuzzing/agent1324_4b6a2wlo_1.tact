struct Nested {
    a: Int;
    b: Bool;
    c: Inner;
}

struct Inner {
    d: Int?;
    e: String;
}

contract TestContract {
    field1: Nested;

    init() {
        self.field1 = Nested{
            a: 1,
            b: true,
            c: Inner{
                d: 2,
                e: "test"
            }
        };
    }
}