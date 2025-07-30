struct MultiOptional {
    val1: Int?;
    val2: Bool?;
    val3: Slice?;
    val4: Address?;
    val5: Cell?;
    val6: String?;
}

contract MultiOptionalContract {
    data: MultiOptional;
    init() {
        self.data = MultiOptional{
            val1: null,
            val2: null,
            val3: null,
            val4: null,
            val5: null,
            val6: null,
        };
    }
}