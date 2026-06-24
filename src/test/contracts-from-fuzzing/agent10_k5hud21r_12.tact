contract Test {
    receive(msg: Slice) {
        let a = msg.loadInt(32);
    }
}