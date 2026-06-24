contract TestMap {
    fun test() {
        // Testing map of Int to Int
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        dump(m.get(1)!!); // expected output: 100

        // Testing map of Address to Int
        let m2: map<Address, Int> = emptyMap();
        m2.set(myAddress(), 200);
        dump(m2.get(myAddress())!!); // expected output: 200
    }
    receive() { self.test(); }
}
