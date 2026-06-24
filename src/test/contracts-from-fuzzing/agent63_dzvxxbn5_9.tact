contract TestGetterMapAccess {
    m: map<Int, Int>;  // persistent map, defaults to empty

    receive() {}

    // Getter: access a non-existent key 999, expecting to return null
    get fun getNonExistentKey(): Int? {
        return self.m.get(999);
    }
}
