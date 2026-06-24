struct Inner {
    a: Int;
    b: String?;
    c: Bool;
    d: Int?;
}

struct Outer {
    inner: Inner?;
    label: String;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                a: 5,
                b: null,
                c: true,
                d: null
            },
            label: "testing"
        };
    }
}