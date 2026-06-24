contract TestMaps() {
    // This contract tests map operations as described in the documentation
    fun test() {
         // Create an empty map of Int to Int (type ascription required)
         let m: map<Int, Int> = emptyMap();
         m.set(1, 42);  // set key 1 to value 42
         // Retrieve value; the get returns an optional so use non-null assertion
         let value: Int = m.get(1)!!;
         dump(value); // expected output: 42

         // Test deletion and existence
         let deleted: Bool = m.del(1);
         dump(deleted); // expected output: true
         let exists: Bool = m.exists(1);
         dump(exists); // expected output: false
    }

    receive() {
         self.test();
         cashback(sender());
    }
}
