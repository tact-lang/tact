contract Test {
    fun getOpt() : Int? {
         return 42;
    }
    
    receive() {
         // Test with an optional type
         dump(self.getOpt());
         dump(null);
         
         // Test with a primitive type (Int)
         dump(123);
         
         // Test with a Bool
         dump(true);
         
         // Test with a map as a proxy for a struct
         let m: map<Int, Int> = emptyMap();
         m.set(1, 2);
         dump(m);
         
         // Test with Cell, Builder, and Slice
         dump(emptyCell());
         dump(beginCell());
         dump(emptySlice());
    }
}
