contract TestGetterMapMissing {
    // State variable: an empty map from Int to Int
    m: map<Int, Int> = emptyMap();

    // Getter that tries to retrieve a non-existent key, returning an optional Int
    get fun getValueMissing(): Int? {
        return self.m.get(42);
    }

    receive() {
        // Call the getter
        let result = self.getValueMissing();
    }
}
