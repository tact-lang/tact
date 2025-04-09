contract MixedComplex {
    number: Int as int32;
    logic: Bool;
    addr: Address;
    sliceData: Slice;
    text: String;

    init() {
        self.number = 1234;
        self.logic = true;
        self.addr = myAddress();
        self.sliceData = emptyCell().asSlice();
        self.text = "testing";
    }
}