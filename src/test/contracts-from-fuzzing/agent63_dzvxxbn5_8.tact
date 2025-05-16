contract TestGetMap {
    m: map<Int, Int>;  // persistent maps are initialized empty by default

    receive() {}

    get fun getMap() : map<Int, Int> {
        return self.m;
    }
}
