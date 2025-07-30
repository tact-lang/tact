/* Snippet 9: Using wildcard as a parameter in a regular function (expected to be rejected)
   Wildcard is reserved and allowed only in receive parameters.
*/
contract Test {
    fun f(_ : Int): Int { return 42; }
    receive() { self.f(10); }
}
