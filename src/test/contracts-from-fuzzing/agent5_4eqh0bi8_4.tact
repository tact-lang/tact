contract MapSimpleTest {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Typical usage: set key 1 to value 100 and then get the value
        self.m.set(1, 100);
        let v: Int? = self.m.get(1);
    }
}
