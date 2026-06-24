struct Inner {
    foo: Int;
    bar: Bool?;
}

struct Outer {
    inner: Inner;
    label: String;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{ inner: Inner{ foo: 10, bar: true }, label: "lbl" };
    }
}
