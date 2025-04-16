contract TestMapBool {
    receive() {
        let m: map<Int, Bool> = emptyMap();
        m.set(0, true);
        m.set(1, false);
    }
}
