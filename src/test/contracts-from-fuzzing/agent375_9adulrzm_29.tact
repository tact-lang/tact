struct StringNested {
    s: String;
    inner: Inner;
}

struct Inner {
    s2: String;
}

contract TestContract {
    data: StringNested;

    init() {
        self.data = StringNested{
            s: "hi",
            inner: Inner{s2:"there"}
        };
    }
}
