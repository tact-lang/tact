struct EmptyOptionalTest {
    opt: InlineDefault?;
}

struct InlineDefault {
    foo: Int = 42;
    bar: Bool = false;
}

contract OptStructContract {
    value: EmptyOptionalTest;

    init() {
        self.value = EmptyOptionalTest{
            opt: null
        };
    }
}