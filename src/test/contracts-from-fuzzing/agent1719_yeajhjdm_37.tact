struct Inner {
    n: Int?;
    flag: Bool;
}

contract StructOptionMix {
    s: Inner?;

    init() {
        self.s = null;
    }
}