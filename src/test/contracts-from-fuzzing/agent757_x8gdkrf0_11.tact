struct OptWrap {
    foo: Int? = null;
    bar: String? = null;
}

contract TestContract {
    wrapper: OptWrap;

    init() {
        self.wrapper = OptWrap{};  // rely on null defaults
    }
}