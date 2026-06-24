contract TestMap {
    m: map<Int, Int> = emptyMap();
    
    receive() {}

    get fun getMap(): map<Int, Int> {
        return self.m;
    }
}
