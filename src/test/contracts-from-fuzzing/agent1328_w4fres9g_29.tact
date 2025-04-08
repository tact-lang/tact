struct SChild {
    val: Int;
}

// test optional struct with default null assigned
contract OptStructDefault {
    child: SChild? = null;

    init() {
        self.child = null;
    }
}
