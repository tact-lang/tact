struct S {
    x: Int;
    y: Bool;
}

contract OptionalOfStruct {
    sopt: S? = null;

    init() {
        self.sopt = null;
    }
}