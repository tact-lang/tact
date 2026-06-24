struct DefaultsMix {
    a: Int = 1;
    b: Bool;
    c: Int?;
    d: Bool? = null;
}

contract TestContract {
    mix: DefaultsMix;

    init() {
        self.mix = DefaultsMix{ b: true, c: null };
    }
}