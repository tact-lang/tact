contract TestDumpMap {
    receive() {
        let m: map<Int, Int> = emptyMap();
        dump(m);
    }
}
