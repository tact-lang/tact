contract TestOptionalValid {
    fun test() {
        // Valid optional usage: assign null then later a value
        let x: Int? = null;
        x = 255;
        dump(x!!); // should dump 255
    }
    receive() {
        self.test();
        return;
    }
}
