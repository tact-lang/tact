message ShiftMsg {
    shift: Int;
}

contract TestDynamicShift {
    receive(msg: ShiftMsg) {
        // Dynamic shift test using a value from the message.
        // If msg.shift is too high, it should trigger an overflow error (exit code 4) at runtime.
        try {
            let res: Int = 1 << msg.shift;
            dump(res);
        } catch (err) {
            dump(err);
        }
    }
}
