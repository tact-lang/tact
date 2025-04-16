contract TestMap {
    m: map<Int, Int> = emptyMap();

    receive() {}

    get fun get_map_value(): Int? {
         return self.m.get(10);
    }
}
