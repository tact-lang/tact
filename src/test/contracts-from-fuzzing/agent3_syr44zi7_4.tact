contract Test {
    myMap: map<Int, Int>;

    receive() {
        self.myMap = emptyMap();
        // Testing .set operation: inserting the key-value pair (100, 200)
        self.myMap.set(100, 200);
        
        // Testing .get operation to retrieve the value from key 100
        let r: Int? = self.myMap.get(100);
        dump(r); // Expected to dump 200
    }
}
