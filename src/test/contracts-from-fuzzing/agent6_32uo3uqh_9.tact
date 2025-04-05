contract TestContract {
    receive(msg: Slice) {
        let body = msg.loadInt(32);
    }
}