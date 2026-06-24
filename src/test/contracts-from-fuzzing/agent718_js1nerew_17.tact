contract BitEdgeValues {
    oneBitUInt: Int as uint1;
    oneBitInt: Int as int1;

    init() {
        self.oneBitUInt = 1;    // max for uint1
        self.oneBitInt = -1;    // min for int1
    }
}