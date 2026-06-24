contract TestOptionalsValid {
    fun run() {
        // Valid use of optional type: assignment of null and then non-null value
        let opt: Int? = null;
        opt = 456;
        dump(opt!!);
    }
    receive() {}
}
