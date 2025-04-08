struct Data {
    val: Int;
}

contract OptionalNullTest {
    item: Data?;

    init() {
        self.item = null;
    }

    receive() {}
}