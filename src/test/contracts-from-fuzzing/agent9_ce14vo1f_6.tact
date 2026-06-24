contract ModifyDuringIteration {
    myMap: map<Int, Int>;

    init() {
        self.myMap = emptyMap();
        self.myMap.set(1, 10);
        self.myMap.set(2, 20);
        self.myMap.set(3, 30);
        
        // Attempt to modify the map while iterating over it
        foreach (k, v in self.myMap) {
            self.myMap.set(k, v + 1);
        }
    }

    get fun getFirst(): Int {
        return self.myMap.get(1)!!;
    }
}
