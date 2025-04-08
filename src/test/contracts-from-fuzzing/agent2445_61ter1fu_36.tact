contract Forbidden {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
    }

    receive() {}
}