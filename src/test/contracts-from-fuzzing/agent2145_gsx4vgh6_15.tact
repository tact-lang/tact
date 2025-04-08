struct SInner {
    s: String;
    flag: Bool?;
}

contract StorageTest {
    inner1: SInner?;
    inner2: SInner;

    init() {
        self.inner1 = null;
        self.inner2 = SInner { s: "hello", flag: null };
    }
}