struct InStruct {
    x: Int;
    y: Bool;
}

contract OptInStruct {
    s: InStruct?;

    init() {
        self.s = null;
    }
}
