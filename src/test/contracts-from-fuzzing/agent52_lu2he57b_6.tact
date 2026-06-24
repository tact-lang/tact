asm fun myDepth(): Int { DEPTH }

contract AsmTest {
    fun test(): Int {
         return myDepth();
    }
    
    receive() {
         let _ = self.test();
         cashback(sender());
    }
}
