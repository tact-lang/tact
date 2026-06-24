struct InnerMost {
    word: String?;
}

struct Inner {
    val: Int;
    optInnerMost: InnerMost?;
}

contract OptionInsideStruct {
    d: Inner;

    init() {
        self.d = Inner{
            val: 100,
            optInnerMost: null
        };
    }
}