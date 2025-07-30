contract TestContract {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        dump(m);
    }
}
