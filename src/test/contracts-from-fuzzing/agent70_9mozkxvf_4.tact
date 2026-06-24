contract Test {
    receive(msg: Slice) {
        dump(msg);
    }
}