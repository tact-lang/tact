struct S {
    x: Int;
}

contract DefaultOptionalInit {
    optS: S?;

    init() {
        self.optS = null;
    }
}