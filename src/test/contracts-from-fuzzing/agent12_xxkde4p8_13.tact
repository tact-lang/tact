message MsgDiv {
    value: Int;
}

contract TestTryCatchDiv {
    receive(msg: MsgDiv) {
        let a: Int = 10;
        // Perform dynamic division. At runtime, if msg.value is zero, division fails.
        try {
            let result: Int = a / msg.value;
            dump(result);
        } catch (err) {
            dump(err);
        }
    }
}
