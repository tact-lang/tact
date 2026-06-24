contract Test {
    m: map<Int, Int> = emptyMap();

    get fun getMap(): map<Int, Int> {
        return self.m;
    }

    receive() {
        self.getMap();
    }
}
