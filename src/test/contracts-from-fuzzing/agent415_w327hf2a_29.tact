struct Ser {
    n: Int as uint64;
}

contract OptionalSerStruct {
    s: Ser?;

    init() {
        self.s = null;
    }
}