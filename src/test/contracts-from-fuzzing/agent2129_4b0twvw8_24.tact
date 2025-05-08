struct NestedOpt {
    val: Int?;
}

contract DefaultOpt {
    d: NestedOpt?;

    init() {
        self.d = null;
    }
}