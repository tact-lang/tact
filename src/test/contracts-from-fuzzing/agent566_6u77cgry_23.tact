struct InnerDeep {
    p: Int;
}

struct MidDeep {
    inner: InnerDeep;
}

struct OuterDeep {
    inner: MidDeep;
}

contract DeepStructure {
    val: OuterDeep;

    init() {
        self.val = OuterDeep{
            inner: MidDeep{
                inner: InnerDeep{
                    p: 55
                }
            }
        };
    }
}