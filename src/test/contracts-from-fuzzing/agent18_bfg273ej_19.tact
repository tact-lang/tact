contract TestMapBool {
    receive() {
        // Testing map with Int keys and Bool values
        let m: map<Int, Bool> = emptyMap();
        m.set(10, true);
        m.set(20, false);
        // Check values
        if (m.get(10)!! && !m.get(20)!!) {
            dump(1); // Expected output: 1
        } else {
            dump(0);
        }
    }
}
