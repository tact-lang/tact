contract OptionalsTest() {
    // Test the behavior of optional types
    fun checkOptional(): Int {
         let opt: Int? = null;
         if (opt == null) {
             // Assign a value if null
             opt = 200;
         }
         // The non-null assertion should succeed here
         return opt!!;
    }
    
    receive() {
         let x = self.checkOptional();
         // The result should be 200
         // Using dump to avoid optimization removal
         dump(x);
    }
}
