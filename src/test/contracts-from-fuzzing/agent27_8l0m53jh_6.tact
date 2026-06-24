contract Test3 {
    m: map<Int,Int>;
    
    receive() {}

    // Getter accessing map, key might not exist
    get fun getMapValue(key: Int): Int? {
        return self.m.get(key);
    }
}
