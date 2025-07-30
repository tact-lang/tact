struct Inner1 {
    foo: Int;
    bar: Bool?;
    baz: String;
}

struct Inner2 {
    qux: Int?;
    quux: Bool;
}

struct Mix {
    first: Inner1;
    second: Inner2;
    label: String?;
}

contract TestContract {
    m: Mix;
    init() {
        self.m = Mix{
            first: Inner1{ foo: 5, bar: null, baz: "b" },
            second: Inner2{ qux: null, quux: true },
            label: "hi",
        };
    }
}