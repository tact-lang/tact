struct ValWrap {
    i: Int = 0;
}

contract ValWrapTest {
    wrap: ValWrap;

    init() {
        self.wrap = ValWrap{};
    }
}