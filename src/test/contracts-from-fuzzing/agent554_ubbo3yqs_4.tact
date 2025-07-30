struct L {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Address;
    val5: Cell;
    val6: Slice;
}

contract WideVariety {
    state: L;

    init() {
        self.state = L{
            val1: 1,
            val2: false,
            val3: "hi",
            val4: myAddress(),
            val5: emptyCell(),
            val6: emptyCell().asSlice(),
        };
    }
}