struct DefaultOptNest {
    foo: Int? = null;
    bar: Bool = true;
}

contract DefaultOptNestTest {
    data: DefaultOptNest;
    init() {
        self.data = DefaultOptNest{};
    }
}