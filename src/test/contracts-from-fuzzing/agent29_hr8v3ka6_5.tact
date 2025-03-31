contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(42, 100);
        let v: Int = m.get(42)!!;
        dump(v); // Expected output is 100
    }
}
