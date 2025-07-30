struct DefaultOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract DefaultOptionalInit {
    state: DefaultOptionals;

    init() {
        self.state = DefaultOptionals { a: null, b: null, c: null };
    }
}