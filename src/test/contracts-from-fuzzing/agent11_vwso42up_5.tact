contract MapGetter {
    m: map<Int, Int>;

    receive() {}

    // Getter returns the map m as is
    get fun get_map() : map<Int, Int> {
        return self.m;
    }
}
