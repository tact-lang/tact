message SomeMsg {
    data: Int;
}

contract UnderscoreTest {
    dummy: Int = 0;

    // Receiver with underscore parameter discard
    receive(_: SomeMsg) {
        self.dummy = self.dummy + 1;
    }
}
