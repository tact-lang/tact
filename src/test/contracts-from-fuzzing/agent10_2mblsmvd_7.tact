contract DebugBuilder {
    receive() {
        let builder: Builder = beginCell();
        dump(builder);
    }
}
