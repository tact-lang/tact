struct S2 {
    s: String;
    optS: String?;
}

struct Container {
    a: Int;
    b: Int?;
    inner: S2;
}

contract TestContract {
    f: Container;

    init() {
        self.f = Container{
            a: 123,
            b: 456,
            inner: S2{ s: "str", optS: null }
        };
    }
}