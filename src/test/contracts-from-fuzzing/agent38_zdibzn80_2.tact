contract Test1 {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
    }
}
