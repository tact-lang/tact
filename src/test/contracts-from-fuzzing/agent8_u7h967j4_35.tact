struct D {
    foo: Int = 1;
}

contract UseDef {
    d: D;

    init() {
        self.d = D{};
    }
}