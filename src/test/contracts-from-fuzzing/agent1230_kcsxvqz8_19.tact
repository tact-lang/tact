struct DefaultsMix {
    a: Int = 7;
    b: Bool;
    c: String = "foo";
}

contract NoInitDefault {
    mixed: DefaultsMix;

    init() {
        self.mixed = DefaultsMix{ b: true };
    }
}