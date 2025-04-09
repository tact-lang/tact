struct DefaultMix {
    a: Int = 5;
    b: Bool;
    c: String?;
}

contract TestContract {
    mixed: DefaultMix;
    init() {
        self.mixed = DefaultMix{
            b: false,
            c: "hello"
        };
    }
}