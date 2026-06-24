struct InlineDefault {
    foo: Int = 7;
    bar: String = "ok";
}

contract TestContract {
    val: InlineDefault;

    init() {
        self.val = InlineDefault{};
    }
}