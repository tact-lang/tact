contract TestMap {
    myMap: map<Int, Int>;

    receive() {}
    
    get fun getMap(): map<Int, Int> {
         return self.myMap;
    }
}
