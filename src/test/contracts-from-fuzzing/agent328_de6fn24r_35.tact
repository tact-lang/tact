struct LotsOfOpts {
    a1: Int? = null;
    a2: Int? = null;
    a3: Int? = null;
    a4: Int? = null;
    a5: Int? = null;
    a6: String? = null;
    a7: String? = null;
    a8: String? = null;
    a9: Bool? = null;
    a10: Bool? = null;
    a11: Cell? = null;
    a12: Cell? = null;
    a13: Address? = null;
    a14: Address? = null;
    a15: Slice? = null;
    a16: Slice? = null;
    a17: Int? = null;
    a18: String? = null;
    a19: Bool? = null;
    a20: Address? = null;
}

contract Test {
    manyNulls: LotsOfOpts;
    init() {
        self.manyNulls = LotsOfOpts{};
    }
}