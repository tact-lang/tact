struct DeepOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
}

struct DeepWrap {
    inner: DeepOptional?;
}

contract TestDeepOptionals {
    container: DeepWrap;

    init() {
        self.container = DeepWrap{
            inner: null
        };
    }
}
