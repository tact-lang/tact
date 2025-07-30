contract DebugOptionalLet {
    receive() {
        let x: Int? = 456;
        dump(x);
    }
}
