contract TestOptionals() {
    fun test() {
        // Testing optionals and the non-null assertion operator (!!)
        let optionalVal: Int? = null;
        optionalVal = 255;
        dump(optionalVal!!); // expected output: 255
    }
    receive() {
        self.test();
    }
}
