contract TestBool() {
    fun test() {
        let b1: Bool = true;
        let b2: Bool = false;
        require(b1 && !b2, "Bool operation failed");
        dump(b1);
    }
}
