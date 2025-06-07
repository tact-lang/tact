contract TestMap {
    m: map<Int, Bool>;

    receive() {}

    get fun get_map(): map<Int, Bool> {
        return self.m;
    }
}
