contract BooleanTest {
    fun test() {
        let t: Bool = true;
        let f: Bool = false;
        require(t && !f, "Bool logic failed");
        require(t || f, "Bool logic failed");
    }

    receive() {
        self.test();
    }
}
