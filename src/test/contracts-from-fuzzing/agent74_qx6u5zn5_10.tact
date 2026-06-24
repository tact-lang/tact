contract TestNonExistentMapGetter {
    arr: map<Int, Int>;

    init() { /* no keys set */ }

    receive() {}

    get fun getMap(): Int? {
        return self.arr.get(100);
    }
}
