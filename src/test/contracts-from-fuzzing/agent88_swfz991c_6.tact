contract TestMapValid() {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(0, 42);
        let val: Int = m.get(0)!!; // Expected 42
        dump(val);
    }
}
