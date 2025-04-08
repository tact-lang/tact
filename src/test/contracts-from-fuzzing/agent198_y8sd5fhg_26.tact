struct InnerMost {
    x: Int;
}

struct InnerOptional {
    nested: InnerMost?;
}

struct Out {
    inner: InnerOptional;
}

contract ChainWithNull {
    val: Out;

    init() {
        self.val = Out{
            inner: InnerOptional{
                nested: null
            }
        };
    }
}
