contract TestGetterMap {
    // Declare a persistent mapping from Int keys to Bool values
    mapping: map<Int, Bool>;

    receive() {}

    // Getter to retrieve a value from the mapping by key
    // When the key does not exist, it returns null
    get fun getMapEntry(key: Int): Bool? {
         return self.mapping.get(key);
    }
}
