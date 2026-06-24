contract LocalVariableMutationTest {
    fun test(): Int {
         let x: Int = 1;
         x = x + 1; // re-assignment attempt
         return x;
    }
}
