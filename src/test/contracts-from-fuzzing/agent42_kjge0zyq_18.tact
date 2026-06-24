struct Some {
    x: Int;
}

contract OptToNull {
    s: Some?;

    init() {
        self.s = null;
    }
}