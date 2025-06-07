contract MapTest {
    fun run() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let v: Int = m.get(1)!!;
        dump(v);
    }
}
