struct SN {
    text: String?;
}

struct Holder {
    nested: SN;
    i: Int;
}

contract HolderOpt {
    val: Holder;
    init() {
        self.val = Holder{ nested: SN{text: null}, i:5 };
    }
}