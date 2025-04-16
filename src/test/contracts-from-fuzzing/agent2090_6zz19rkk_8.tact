struct SubData {
    a: Int;
    b: Bool;
    c: String?;
    d: Slice;
}

contract OptStructTest {
    info: SubData?;

    init() {
        self.info = null;
    }
}