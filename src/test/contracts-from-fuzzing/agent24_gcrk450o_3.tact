contract MapTestSet {
    myMap: map<Int, Int>;

    init() {
        self.myMap = emptyMap();
    }

    receive() {
        // Test typical map.set usage
        self.myMap.set(1, 123);
    }
}
