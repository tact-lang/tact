struct Mid {
    b: Int;
}

contract OptionalMidStruct {
    m: Mid?;

    init() {
        self.m = null;
    }
}