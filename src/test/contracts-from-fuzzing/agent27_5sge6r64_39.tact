// optional Cell and optional Address with serialization attrs
contract TestContract {
    c: Cell?;
    a: Address?;
    init() {
        self.c = null;
        self.a = null;
    }
}
