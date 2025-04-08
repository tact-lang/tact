struct WrappedOptionalStruct {
    inner: Bool?;
}

struct TopLevel {
    container: WrappedOptionalStruct;
}

contract Test {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            container: WrappedOptionalStruct{
                inner: true
            }
        };
    }
}
