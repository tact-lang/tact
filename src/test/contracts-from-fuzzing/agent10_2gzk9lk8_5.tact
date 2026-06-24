contract ReceiverTest {
    receive(msg: Slice) {
        // Receiver functions typically do not return a value
        return;
    }

    // Additionally test implicit return in a receiver
    receive(str: String) {
        // last expression is executed, should be allowed as well
        dump(str);
    }
}
