struct DefaultsMix {
    a: Int = 5;
    b: Bool?;
    c: Bool = false;
}

contract StructDefaultsMix {
    s: DefaultsMix;

    init() {
        self.s = DefaultsMix{ b: null };
    }

    receive() {}
}