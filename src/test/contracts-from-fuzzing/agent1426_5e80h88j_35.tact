// Struct with nested struct containing many optionals
struct Inner {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
}

struct Outer {
    one: Int;
    inner: Inner;
}

contract NestedOpts {
    st: Outer;

    init() {
        self.st = Outer{
            one:1,
            inner: Inner{
                a:null,
                b:2,
                c:null,
                d:4
            }
        };
    }
}