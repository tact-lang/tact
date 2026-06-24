// TestOptionalValid: Valid usage of optionals
contract TestOptionalValid() {
    fun run() {
         let opt: Int? = null;
         opt = 123;
         dump(opt!!); // should print 123
         if (opt != null) {
             dump(1);
         } else {
             dump(0);
         }
    }
    receive() {
         self.run();
         return;
    }
}
