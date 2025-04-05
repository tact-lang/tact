contract MapTest {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        require(m.get(1)!! == 10, "Map get failed: expected 10");
        m.set(1, 20);
        require(m.get(1)!! == 20, "Map override failed: expected 20");
        let delRes: Bool = m.del(1);
        require(delRes, "Map deletion failed: expected true");
        require(m.get(1) == null, "Map deletion did not yield null");
    }
    
    receive() {
        self.test();
    }
}
