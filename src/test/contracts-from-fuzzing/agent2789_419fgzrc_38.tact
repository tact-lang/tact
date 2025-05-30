struct BuilderWrap {
    b: Builder;
}

contract BuilderPersistentTest {
    builder: BuilderWrap;

    init() {
        self.builder = BuilderWrap{
            b: beginCell()
        };
    }
}
