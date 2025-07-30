contract MapGetter {
    m: map<Int, Int>;
    
    receive() {}
    
    get fun getValue(key: Int) : Int? {
        return self.m.get(key);
    }
}
