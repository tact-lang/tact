struct IntPair {
    x: Int;
    y: Int;
}

contract DeepOptionalStruct {
    pair: IntPair?;

    init() {
        self.pair = null;
    }
}