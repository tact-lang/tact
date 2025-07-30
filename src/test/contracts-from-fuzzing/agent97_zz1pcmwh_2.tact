contract TestOptionalValid {
    fun test() {
        let opt: Int? = 100;
        dump(opt!!); // Should print 100
    }
    receive() {}
}
