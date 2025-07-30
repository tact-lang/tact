/* Snippet 8: Parameterized contract with implicit empty init
   In Tact, when a contract is declared with parameters but without an explicit init() function,
   an implicit empty init is used. This snippet tests that behavior using initOf.
*/

contract ParamContract(a: Int, b: Int) {
    // Implicit empty init
}

contract TestParamImplicit {
    fun getParamInit() : StateInit {
         return initOf ParamContract(1, 2);
    }
}
