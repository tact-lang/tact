contract DebugBuilder {
    receive() {
        let b = beginCell();
        dump(b);
    }
}
