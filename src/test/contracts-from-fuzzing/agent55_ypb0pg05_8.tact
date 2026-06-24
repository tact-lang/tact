struct MaybePair {
    a: Int;
    b: Int;
}

contract TestOptionalStruct {
    // Default-initialized to null
    pair: MaybePair? = null;

    receive() {}

    get fun getPair(): MaybePair? {
        return self.pair;
    }
}
