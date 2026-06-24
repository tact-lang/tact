contract TestMapGetter {
    arr: map<Int, Int>;

    init() {
        self.arr.set(1, 42);
    }

    receive() {}

    get fun getMapVal(key: Int): Int? {
        return self.arr.get(key);
    }
}
