/*
   AsmTest verifies that a simple assembly function defined with asm fun
   correctly returns the result of the TVM ADD instruction.

   We define an assembly function myAsm that takes two Ints and returns their sum using the ADD instruction.
   In the contract AsmTest, we call myAsm(5, 6) and require the result to equal 11.
*/

asm fun myAsm(a: Int, b: Int): Int { ADD }

contract AsmTest() {
    receive() {
        let result = myAsm(5, 6);
        require(result == 11, "asm addition failed");
        cashback(sender());
    }
}
