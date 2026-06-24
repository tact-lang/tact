struct Mid {
    val: Int;
    txt: String?;
}

struct Top {
    m1: Mid?;
    m2: Mid?;
}

contract DualNullableStruct {
    top: Top;

    init() {
        self.top = Top{m1: null, m2: Mid{val:1, txt:null}};
    }
}