struct DefaultMap {
    m: map<Int, Int> = emptyMap();
}

contract DefaultMapTest {
    receive() {
        let d = DefaultMap { };
        d.m.set(10, 55);
        let v = d.m.get(10)!!; // Expected to be 55
    }
}
