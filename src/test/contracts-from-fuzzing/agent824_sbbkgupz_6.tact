struct Outer {
    i: Int;
    inner: Inner;
}

struct Inner {
    str: String;
    flag: Bool;
    nested: Nested;
}

struct Nested {
    a: Int;
    b: Int;
    c: Int;
}

contract TestContract {
    ofield: Outer;

    init() {
        self.ofield = Outer{
            i: 10,
            inner: Inner{
                str: "test",
                flag: true,
                nested: Nested{
                    a: 1,
                    b: 2,
                    c: 3,
                }
            }
        };
    }
}
