contract TestMap() {
    fun test() {
        // Create an empty map from Int to Int
        let myMap: map<Int, Int> = emptyMap();
        
        // Insert value 42 for key 0
        myMap.set(0, 42);
        
        // Retrieve the value for key 0 using get and non-null assertion
        let value: Int = myMap.get(0)!!;
        dump(value); // expected output: 42
        
        // Replace value at key 0 with 100 using replaceGet
        let replaced: Int = myMap.replaceGet(0, 100)!!;
        dump(replaced); // expected output: 42
        
        // Now key 0 should have value 100
        let newVal: Int = myMap.get(0)!!;
        dump(newVal); // expected output: 100
        
        // Delete key 0 and then check its existence
        myMap.del(0);
        let exists: Bool = myMap.exists(0);
        dump(exists); // expected output: false
    }

    receive() {
        self.test();
    }
}
