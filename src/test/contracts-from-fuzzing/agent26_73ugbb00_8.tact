message SimpleMsg { value: Int }

contract ReceiverTest {
    receive(msg: SimpleMsg) {
        // Early exit in nested block
        if (msg.value > 10) {
            { return; }
        }
        dump(msg.value);
    }
}
