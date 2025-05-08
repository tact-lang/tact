struct DefOpts {
    foo: Int = 5;
    bar: Bool?;
    baz: String = "abc";
}

contract TestContract {
    data: DefOpts;

    init() {
        self.data = DefOpts{
            foo: 7,
            bar: null,
            baz: "zzz"
        };
    }
}