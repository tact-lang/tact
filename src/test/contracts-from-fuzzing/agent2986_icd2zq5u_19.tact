struct AStruct {
    i: Int;
    b: Bool;
}

contract OptionalExplicit {
    s: AStruct?;

    init() {
        self.s = null;
    }
}