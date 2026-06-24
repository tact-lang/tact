struct Middle {
    m1: Int;
    m2: Bool;
    m3: String;
}

contract OptionalStruct {
    nested: Middle?;

    init() {
        self.nested = null;
    }
}