const TON_ONE: Int = ton("1");
const ASCII_LIGHTNING: Int = ascii("⚡");

contract TestConstants() {
    fun show() {
         dump(TON_ONE);          // Expected: 1000000000
         dump(ASCII_LIGHTNING);  // Expected: 14850721
    }
    
    receive() {
         self.show();
    }
}
