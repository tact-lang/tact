struct InnerMost {
    a: Int;
}
struct Inner {
    opt: InnerMost?;
}
struct DeepWrap {
    inner: Inner;
}

contract TestContract {
    data: DeepWrap;

    init() {
        self.data = DeepWrap{
            inner: Inner{
                opt: InnerMost{ a:42 }
            }
        };
    }
}