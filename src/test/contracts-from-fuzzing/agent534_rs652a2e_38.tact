struct NestOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract DeepOptNesting {
    val: NestOpt;

    init() {
        self.val = NestOpt{
            inner:null
        };
    }
}