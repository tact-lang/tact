struct InnerMost {
    opt: Int?;
}

struct Middle {
    inner: InnerMost?;
}

contract OptionalAroundStruct {
    val: Middle;

    init() {
        self.val = Middle{ inner: null };
    }
}