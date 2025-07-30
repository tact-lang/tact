message(1010) Msg {
    num: Int;
}

contract MessagePersistenceTest {
    data: Msg;

    init() {
        self.data = Msg{num: 42};
    }
}