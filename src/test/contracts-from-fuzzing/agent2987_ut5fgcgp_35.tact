contract UnusualFieldNames {
    _foo: Int;
    __bar__: Bool;
    Baz123: Slice?;

    init() {
        self._foo = 1;
        self.__bar__ = false;
        self.Baz123 = null;
    }
}
