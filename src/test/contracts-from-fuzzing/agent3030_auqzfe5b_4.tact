struct OptionTest {
    foo: Int?;
    bar: String?;
    baz: Bool?
}

contract OptContract {
    opt: OptionTest;

    init() {
        self.opt = OptionTest{
            foo: null,
            bar: "hello",
            baz: null
        };
    }
}