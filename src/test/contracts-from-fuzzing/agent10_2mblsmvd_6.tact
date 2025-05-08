contract DebugOptionalNull {
    receive() {
        let a: Int? = null;
        dump(a);
    }
}
