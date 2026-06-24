struct DefaultedOpt {
    a: Int? = null;
    b: Int = 5;
    c: Bool? = true;
}

contract InitDefaultedOpt {
    data: DefaultedOpt;

    init() {
        self.data = DefaultedOpt{
            a: null,
            b: 7,
            c: false,
        };
    }
}
