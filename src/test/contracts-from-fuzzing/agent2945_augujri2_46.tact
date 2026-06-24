struct Mix {
    a: Int;
    b: Bool?;
}

contract OptMix {
    v: Mix?;

    init() {
        self.v = null;
    }
}