struct DefaultOptionals {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefaultOptVals {
    data: DefaultOptionals;

    init() {
        self.data = DefaultOptionals{};
    }
}