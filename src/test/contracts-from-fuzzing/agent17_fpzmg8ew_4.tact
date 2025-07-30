contract GetterNonexistentMap {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
    }

    // Getter accessing a non-existent map key, expected to return null
    get fun getMissing(): Int? {
       return self.m.get(100);
    }

    receive() {}
}
