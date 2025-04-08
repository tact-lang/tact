struct Quux {
    foo: Int? as uint8;
}

contract TestContract {
    q: Quux;

    init() {
        self.q = Quux{ foo: null };
    }
}