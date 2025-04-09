contract Test {
    receive(msg: Slice) {
        let amount = msg.loadInt(64);
    }
}