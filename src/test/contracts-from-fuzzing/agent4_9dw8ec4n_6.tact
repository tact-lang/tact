/* Test 3: Recursive initialization using initOf on the same contract */

contract A {
    init() {
        // Attempt to compute the initial state of the same contract inside its own init()
        let s = initOf A();
    }

    receive() {
        // empty receive
    }
}
