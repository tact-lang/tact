contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {
         self.m.set(1, 10);
    }
}
