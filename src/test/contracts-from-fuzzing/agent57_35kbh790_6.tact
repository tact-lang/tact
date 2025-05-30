contract TestGetterMap {
    // A map of Int to Bool using angle bracket syntax
    m: map<Int, Bool>;

    init() {
        // leave map empty
    }

    receive() {}

    // Getter returns the entire map
    get fun getMap(): map<Int, Bool> {
        return self.m;
    }
}
