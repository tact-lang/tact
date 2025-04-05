// Test case for Maps
contract TestMap() {
    fun test() {
        // Create a map of Int to Int
        let m: map<Int, Int> = emptyMap();
        m.set(0, 10);        // set key 0 to 10
        dump(m.get(0)!!);      // should output 10
        m.set(0, 42);         // update key 0 to 42
        dump(m.get(0)!!);      // should output 42
        let deleted = m.del(0);
        dump(deleted);         // should output true
        dump(m.exists(0));     // should output false
    }
    receive() {
        self.test();
    }
}
