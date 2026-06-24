contract MapInStorage {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
    }
}