struct One { number: Int; }

contract StructLiteralTest {
    fun test(): Int {
         let x: One = One{ number: 50 };
         return x.number; // Expected: 50
    }
    
    receive() {
         self.test();
    }
}
