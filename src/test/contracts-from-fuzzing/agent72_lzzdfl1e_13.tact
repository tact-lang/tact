contract TestMapMissing {
    // Persistent state variable; maps are empty by default
    dict: map<Int, Int>;

    receive() {}

    // Getter returns the value for a given key, or null if key not found
    get fun getMissing(key: Int): Int? {
        return self.dict.get(key);
    }
}
