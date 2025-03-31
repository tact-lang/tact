contract TestMapFixed {
    m: map<Int, Int>;

    // Getter that accesses an element from the map using .get(), returning Int?
    get fun getFromMap(key: Int): Int? {
        return self.m.get(key);
    }
    
    receive() {}
}
