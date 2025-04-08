struct STest {
    x: Int;
}

contract OptStructField {
    data: STest?;

    init() {
        self.data = null;
    }
}
