contract TestMapKey {
    m: map<Int, Int>;

    receive() {}

    get fun getMissingKey(): Int? {
        // Attempt to fetch a key that doesn't exist
        return self.m.get(999);
    }
}
