contract TestOptionalsValid {
    fun run() {
        // Optional type usage as per [Optionals] documentation
        let opt: Int? = null;
        opt = 123;
        // Access via non-null assertion operator (!!)
        dump(opt!!);
    }
    receive() {
        self.run();
    }
}
