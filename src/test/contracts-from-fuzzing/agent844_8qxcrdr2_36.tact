struct Wrapped {
    value: Int;
    note: String?;
}

contract WrappedOptionalTest {
    payload: Wrapped?;

    init() {
        self.payload = null;
    }

    receive() {
        let _ = self.payload;
    }
}