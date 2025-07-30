struct OptionalNoInit {
    a: Int?;
}

contract TestOptionalNoInit {
    s: OptionalNoInit;

    init() {
        self.s = OptionalNoInit{a: null};
    }
}