struct EmptyOpt {
    a: Int?;
}

struct WrapOpt {
    inner: EmptyOpt?;
}

contract NullWrapped {
    data: WrapOpt;
    init() {
        self.data = WrapOpt{
            inner:null
        };
    }
}