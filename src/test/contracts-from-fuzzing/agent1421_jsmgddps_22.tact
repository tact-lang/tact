struct Recursing {
    value: Int;
}

contract InitSetsField {
    x: Int;
    r: Recursing;
    init() {
        self.x = 1;
        self.r = Recursing{value:42};
    }
}