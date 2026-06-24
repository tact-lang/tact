struct Xtr {
    foo: Int?;
    bar: Bool = true;
    baz: String?;
}

contract InitPartialOpt {
    data: Xtr;

    init() {
        self.data = Xtr{
            foo: null,
            bar: false,
            baz: "abc"
        };
    }
}