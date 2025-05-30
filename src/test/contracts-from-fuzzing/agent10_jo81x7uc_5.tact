/* Test 5: Self-recursive initialization using initOf within the same contract */

contract SelfRec {
    init() {
         // Self call: Using initOf RecSelf inside its own init function
         let dummy = initOf SelfRec();
    }
    fun test(): Int {
         return 100;
    }
}
