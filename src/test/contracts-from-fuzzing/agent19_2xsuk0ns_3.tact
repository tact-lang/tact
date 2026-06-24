/* Test 3: Recursive initialization within the same contract */

contract Recursive {
    init() {}
    get fun test(): Int {
        // Use initOf on self
        let stateSelf: StateInit = initOf Recursive();
        return 100;
    }
}
