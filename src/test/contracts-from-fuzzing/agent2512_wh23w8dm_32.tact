struct NestedOpt {
    v: Int;
}

contract OptionalLateInit {
    a: NestedOpt?;

    init() {
        self.a = null;
    }
}