/* Snippet 3: Self-recursive initOf usage within the same contract */

contract SelfRecursive {
    fun getInitCode(): Cell {
         // Obtain the code cell of its own init package
         return (initOf SelfRecursive()).code;
    }
    init() {}
}
