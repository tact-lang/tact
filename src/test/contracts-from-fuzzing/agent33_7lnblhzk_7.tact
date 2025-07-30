struct MaybePair {
    a: Int;
    b: Int;
}

contract TestOptionalStruct {
    maybePair: MaybePair? = null;

    receive() {}

    get fun getMaybePair(): MaybePair? {
        return self.maybePair;
    }
}
