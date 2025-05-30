contract TestIntAsUint8Proper {
    // Declare map with both key and value serialized as uint8
    m: map<Int as uint8, Int as uint8> = emptyMap();

    init() {
        // Set key 1 to value 255
        self.m.set(1, 255);
    }

    receive() {
        let v: Int = self.m.get(1)!!;
        dump(v); // Expected output: 255
    }
}
