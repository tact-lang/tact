/* Snippet 9: Using initOf with compile-time constant expressions for parameterized contract
   This snippet tests whether initOf works correctly when parameters are computed as constant expressions.
*/

contract ParamCalc(a: Int, b: Int) {
    // Implicit empty init used
}

contract UseCalc {
    fun getCalc() : StateInit {
         let sum = 3 + 4;        // Constant expression
         let prod = sum * 2;       
         return initOf ParamCalc(sum, prod);
    }
}
