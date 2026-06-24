struct OptionStruct {
    val1: Int?;
    val2: Bool?;
    val3: Address?;
    val4: Cell?;
    val5: Slice?;
    val6: String?;
}

contract Test {
    st: OptionStruct;

    init() {
        self.st = OptionStruct{
            val1: null,
            val2: null,
            val3: null,
            val4: null,
            val5: null,
            val6: null,
        };
    }
}