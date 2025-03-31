contract TestGetterMapLookup {
    m: map<Int, Int>;

    init() {
         self.m = emptyMap();
         self.m.set(1, 100);
         self.m.set(2, 200);
    }

    receive() {}

    // Getter with an argument to look up a key in a map
    get fun lookup(key: Int): Int? {
         return self.m.get(key);
    }
}
