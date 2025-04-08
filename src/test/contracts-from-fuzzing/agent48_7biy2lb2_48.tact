message(100) Msg { foo: Int }

contract OptMsgTest {
    stored: Msg?;

    init() {
        self.stored = null;
    }
}