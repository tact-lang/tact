contract TestDumpOptionalTernary {
    receive() {
        let a: Int? = (true ? 45 : null);
        dump(a);
    }
}
