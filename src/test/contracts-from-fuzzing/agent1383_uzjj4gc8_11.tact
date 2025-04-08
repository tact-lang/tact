struct S {
    a: Int;
}

contract DeepOptional {
    s: S?;

    init() {
        self.s = null;
    }
}