struct OptOptStruct {
    inner: Int?;
    another: Bool?;
}

contract OptOptTest {
    field: OptOptStruct;

    init() {
        self.field = OptOptStruct{
            inner: null,
            another: null,
        };
    }
}