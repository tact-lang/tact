contract TestDumpOptionalNull {
    receive() {
        let a: Int? = null;
        dump(a);
    }
}
