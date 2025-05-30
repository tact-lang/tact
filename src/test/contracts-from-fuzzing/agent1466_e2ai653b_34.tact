struct DefaultOptionals {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefOptNullTest {
    data: DefaultOptionals;

    init() {
        self.data = DefaultOptionals{};
    }
}
