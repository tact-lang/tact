contract Test7 {
    // Map from Int to Int, default is empty
    data: map<Int, Int> = emptyMap();

    receive() {}

    // Getter that attempts to get a value by key; will return null if key doesn't exist
    get fun getNonExistentValue(key: Int): Int? {
        return self.data.get(key);
    }
}
