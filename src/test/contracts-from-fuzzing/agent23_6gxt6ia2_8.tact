// Snippet: TestSerializationValid - Valid usage of serialization for map

contract TestSerializationValid {
    // Allowed: map keys serialized as uint8 (fixed width)
    state: map<Int as uint8, Int as uint8>;

    init() {
        self.state = emptyMap();
        self.state.set(5, 10);
        let value: Int = self.state.get(5)!!; // should be 10
        let _ = value;
    }

    get fun read(key: Int): Int? {
        return self.state.get(key);
    }
}
