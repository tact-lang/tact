contract TestForeachValid {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        foreach (_, v in m) {
            let x = v; // use v normally; _ is correctly discarded
        }
    }
}
