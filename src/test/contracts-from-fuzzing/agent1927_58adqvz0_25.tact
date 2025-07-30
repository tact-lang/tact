struct OptDeep {
    s: String?;
}

contract NullSetNested {
    val: OptDeep;

    init() {
        self.val = OptDeep{ s: null };
    }
}