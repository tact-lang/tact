contract TestMissingMapKey {
    m: map<Int, Int>;
    
    receive() {}
    
    // Getter returns optional Int, since key may be missing in the map
    get fun getValue(k: Int): Int? {
        return self.m.get(k);
    }
}
