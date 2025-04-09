contract TestOptionalsValid() {
    fun run() {
        let a: Int? = null;
        a = 100;
        dump(a!!); // expected to dump 100
    }
    receive() {
        self.run();
    }
}
