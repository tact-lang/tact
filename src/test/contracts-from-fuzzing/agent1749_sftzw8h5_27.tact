struct S {
    a: Int? = null;
    b: Bool = true;
}

contract OptionalWithDefault {
    val: S;

    init() {
        self.val = S{};
    }
}