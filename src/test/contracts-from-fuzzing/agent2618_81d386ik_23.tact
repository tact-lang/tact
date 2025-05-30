struct InnerPersist {
    foo: Int;
    bar: Bool?;
    str: String;
}

contract PersistTest {
    i: Int;
    inner: InnerPersist;

    init() {
        self.i = 1;
        self.inner = InnerPersist{ foo: 2, bar: null, str: "persist" };
    }
}