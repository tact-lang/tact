struct OptionSlice {
    s: String?;
}

struct OptionNumber {
    i: Int?;
}

contract VariantFieldsTest {
    strOpt: OptionSlice;
    numOpt: OptionNumber;

    init() {
        self.strOpt = OptionSlice{ s: null };
        self.numOpt = OptionNumber{ i: null };
    }
}