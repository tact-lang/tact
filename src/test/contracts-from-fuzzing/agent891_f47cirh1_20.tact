struct BuilderWrap {
    b: Builder;
    c: Builder?;
}

contract BuilderStructTest {
    field: BuilderWrap;

    init() {
        self.field = BuilderWrap{
            b: beginCell(),
            c: null
        };
    }
}
