message(22) SimpleMsg { x: Int }

contract OptMsgPersistence {
    foo: SimpleMsg?;

    init() {
        self.foo = null;
    }
}