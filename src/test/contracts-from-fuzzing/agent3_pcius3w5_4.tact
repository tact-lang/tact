/* Snippet 4: Recursive initialization (self-reference) using initOf in the same contract. */

contract Recur {
    init() {
         let recInit: StateInit = initOf Recur();
    }
}
