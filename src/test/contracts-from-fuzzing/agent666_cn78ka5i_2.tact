struct Wrapped {
    inner: Int?;
}

contract TestOpt {
    wrapped: Wrapped;

    init() {
        self.wrapped = Wrapped{
            inner: null
        };
    }
}
