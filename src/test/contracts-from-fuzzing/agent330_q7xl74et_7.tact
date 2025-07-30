struct OuterOptionalNested {
    inner: InnerOptional?
}

struct InnerOptional {
    inner2: InnerMost?;
}

struct InnerMost {
    val: Int;
    text: String;
}

contract TestContract {
    opt: OuterOptionalNested;

    init() {
        self.opt = OuterOptionalNested{
            inner: InnerOptional{
                inner2: null
            }
        };
    }
}