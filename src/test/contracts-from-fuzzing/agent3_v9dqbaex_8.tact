contract TestNonExistentMap {
    store: map<Int, Int> = emptyMap();

    receive() {}

    get fun getKey10(): Int? {
         return self.store.get(10);
    }
}
