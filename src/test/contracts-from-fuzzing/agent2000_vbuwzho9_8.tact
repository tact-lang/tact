struct Wrapped {
    s: String;
    flag: Bool;
}

contract OptionalAndNested {
    inner: Wrapped?;
    outerInt: Int;
    outerBool: Bool;

    init() {
        self.inner = null;
        self.outerInt = 0;
        self.outerBool = false;
    }
}