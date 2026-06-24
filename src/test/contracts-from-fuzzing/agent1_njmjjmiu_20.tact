contract MapBoolTest {
    receive() {
        // Test map with Bool as value type
        let m: map<Int, Bool> = emptyMap();
        m.set(1, true);
        m.set(2, false);
        dump(m.get(1)!!); // Expected output: true
        dump(m.get(2)!!); // Expected output: false
    }
}
