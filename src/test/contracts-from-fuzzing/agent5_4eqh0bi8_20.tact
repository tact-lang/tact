contract MapSerializationTest2 {
    m: map<Int, Int> = emptyMap();
    k: Int as uint8 = 1; // state variable with explicit coercion annotation

    receive() {
        // Use the state variable k (of type Int, serialized as uint8) as the key
        self.m.set(self.k, 300);
        let v: Int? = self.m.get(self.k);
        dump(v); // Expecting to dump 300
    }
}
