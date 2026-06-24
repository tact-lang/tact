fun testMap() {
    let m: map<Int, Int> = emptyMap();
    m.set(0, 10);
    // Expect to dump 10
    dump(m.get(0)!!);
}

contract TestMap {
    receive() {
        testMap();
    }
}
