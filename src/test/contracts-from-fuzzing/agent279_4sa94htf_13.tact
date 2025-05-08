struct Multiple {
    i: Int;
    b: Bool;
    s: String;
}

contract OptionalFieldsDirect {
    m1: Multiple?;
    m2: Multiple?;
    m3: Multiple?;

    init() {
        self.m1 = null;
        self.m2 = null;
        self.m3 = null;
    }
}