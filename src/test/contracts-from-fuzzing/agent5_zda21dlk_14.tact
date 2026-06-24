contract TestArgGetter {
    m: map<Int, Int> = emptyMap();

    init() {
         self.m.set(1, 100);
    }

    receive() {}

    get fun get_by_key(key: Int): Int? {
         return self.m.get(key);
    }
}
