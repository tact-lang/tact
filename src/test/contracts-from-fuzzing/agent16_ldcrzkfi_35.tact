struct S {
    f1: Int = 99;
}

contract PersistDefault {
    data: S;

    init() {
        self.data = S{};
    }
}