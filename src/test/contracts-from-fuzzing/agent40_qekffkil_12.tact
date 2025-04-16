contract TestMissingKey {
    // Persistent state variable: an empty map of Int to Int
    m: map<Int, Int>;

    // Getter that attempts to retrieve a value for a non-existent key
    get fun getMissing(): Int? {
        return self.m.get(999);
    }

    receive() {}
}
