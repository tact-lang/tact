/// Test for serialized maps using fixed-width serialization (uint8)
contract TestSerialized {
    m: map<Int as uint8, Int as uint8> = emptyMap();

    receive() {
        // Set key 200 to 250, both within 8-bit range
        self.m.set(200, 250);
        let v: Int? = self.m.get(200);
        // Expect to retrieve 250
        dump(v!!);
    }
}
