struct DefaultOptWrap {
    x: Int? = null;
    y: String? = null;
}

contract DefaultedOptionals {
    f: DefaultOptWrap;

    init() {
        self.f = DefaultOptWrap{};
    }
}