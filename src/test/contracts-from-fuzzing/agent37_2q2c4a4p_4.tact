contract TestMapExists {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        if (m.exists(1)) {
            dump(1);
        } else {
            dump(0);
        }
        if (m.exists(2)) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
