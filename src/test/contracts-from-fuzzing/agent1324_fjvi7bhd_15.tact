struct Something {
    flag: Bool;
}

contract OptStructNullAssign {
    s: Something?;

    init() {
        self.s = null;
    }
}