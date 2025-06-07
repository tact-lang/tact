struct Wrapped {
    inner: Int?;
}

contract WrappedOptionals {
    a: Wrapped?;

    init() {
        self.a = Wrapped{ inner: null };
    }
}
