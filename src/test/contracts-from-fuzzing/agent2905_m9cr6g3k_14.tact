struct DeeplyOptional {
    val1: Int?;
    val2: Bool?;
    val3: Address?;
    val4: Cell?;
    val5: Slice?;
    val6: String?;
}

contract SeveralDeepOptionals {
    s1: DeeplyOptional;
    s2: DeeplyOptional;

    init() {
        self.s1 = DeeplyOptional{
            val1: null, val2: null, val3: null, val4: null, val5: null, val6: null
        };
        self.s2 = DeeplyOptional{
            val1: null, val2: null, val3: null, val4: null, val5: null, val6: null
        };
    }
}