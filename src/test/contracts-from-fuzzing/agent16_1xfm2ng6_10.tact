contract DebugMapTest {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 2);
        dump(m);
    }
}
