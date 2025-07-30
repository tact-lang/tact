contract TestMapValid {
    fun run() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let value: Int = m.get(1)!!;
        dump(value);
    }
    receive() {}
}
