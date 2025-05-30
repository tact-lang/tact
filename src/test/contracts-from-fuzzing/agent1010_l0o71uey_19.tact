struct BoolNest {
    flag: Bool;
    inner: Bool;
    optFlag: Bool?;
}

contract BoolNesting {
    container: BoolNest;
    init() {
        self.container = BoolNest{
            flag: true,
            inner: false,
            optFlag: null,
        };
    }
}