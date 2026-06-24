struct S {
    x: Int;
}

contract OptionalAfterDefault {
    s: S = S{x:5};
    o: S?;

    init() {
        self.o = null;
    }
}