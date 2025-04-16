struct InnerMost {
    val: Int;
}

struct Inner {
    v: InnerMost;
}

struct Wrapper {
    w: Inner;
}

contract DeepIntWrap {
    deep: Wrapper;

    init() {
        self.deep = Wrapper{
            w: Inner{
                v: InnerMost{ val: 123 }
            }
        };
    }
}