struct Wrap {
    inner: Int?;
}

contract NilDefaults {
    data: Wrap;

    init() {
        self.data = Wrap{
            inner: null
        };
    }
}