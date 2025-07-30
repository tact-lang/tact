struct C {
    val: Int;
}

contract OptDeep {
    cfield: C?;

    init() {
        self.cfield = null;
    }
}