struct MultiOpt {
    val: Int?;
    txt: String?;
}

contract StructWithMultiOpt {
    s: MultiOpt;

    init() {
        self.s = MultiOpt{
            val: null,
            txt: null
        };
    }
}