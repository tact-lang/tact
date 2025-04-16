contract TestOptionalsValid() {
    fun run() {
        let opt: Int? = null;
        opt = 255;
        // Using non-null assertion to extract the value
        let val: Int = opt!!;
        dump(val); // expected output: 255
    }
    receive() { self.run(); }
}
