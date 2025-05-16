struct MHolder {
    m: map<Int, Int>;
}

contract TestStructWithMap {
    receive() {
        // Create two struct instances with map members
        let a: MHolder = MHolder{ m: emptyMap() };
        let b: MHolder = MHolder{ m: emptyMap() };

        // Set identical key-value pair in both maps
        a.m.set(1, 100);
        b.m.set(1, 100);

        // Use deepEquals to compare the two maps
        if (a.m.deepEquals(b.m)) {
            dump(1); // expected outcome: 1
        } else {
            dump(0);
        }
    }
}
