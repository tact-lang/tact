contract TestDumpOptional {
    receive() {
        let opt: Int? = 456;
        dump(opt);
    }
}
