/*
   Snippet 2: Recursive self-initialization
   Testing if a contract calling initOf on itself in its init function creates recursion issues.
*/

contract RecursiveSelf {
    init() {
        // Recursive call: computing the initial state of itself
        let s: StateInit = initOf RecursiveSelf();
    }
    receive() {}
}
