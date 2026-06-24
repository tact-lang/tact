contract TestMapGetter {
    data: map<Int, Int>;

    init() {
        // set a known key-value pair
        self.data.set(1, 100);
    }

    receive() {}

    get fun getData(): map<Int, Int> {
        return self.data;
    }
}
