contract DebugTestMapDump {
    // Testing dump() with a map from Int to Int
    receive() {
        let m: map<Int,Int> = emptyMap();
        m.set(2 + 2, 4);
        dump(m);
    }
}
