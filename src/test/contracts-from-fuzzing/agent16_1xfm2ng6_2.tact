contract DebugOptional {
    receive() {
        let a: Int? = 5;
        dump(a);
    }
}
