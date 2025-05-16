struct CaseInsensitive {
    Foo: Int;
    foo: Bool;
    bar: String;
}

contract CaseTest {
    val: CaseInsensitive;

    init() {
        self.val = CaseInsensitive{
            Foo: 1,
            foo: true,
            bar: "hi",
        };
    }
}
