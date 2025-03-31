contract TestMapGetter {
    myMap: map<Int, Int>;
    
    init() {
        self.myMap = emptyMap();
        self.myMap.set(1, 100);
        self.myMap.set(2, 200);
    }
    
    receive() {}
    
    get fun getMap(): map<Int, Int> {
        return self.myMap;
    }
}
