contract TestContract {
    receive(in_msg: Slice) {
        let a = in_msg.loadInt(32);
        let b = in_msg.loadBool();
    }
}