contract TestMapValid {
    fun run() {
        // Valid map usage as per [Maps] documentation
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        dump(m.get(1)!!);
    }
    receive() {
        self.run();
    }
}
