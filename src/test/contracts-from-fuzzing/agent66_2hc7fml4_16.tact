contract IamEmptyAndIKnowIt {}

contract TestEmpty {
    receive() {
        // Using initOf on a contract without explicit init
        let s: StateInit = initOf IamEmptyAndIKnowIt();
        // Using codeOf on the same contract; no parentheses are required.
        let c: Cell = codeOf IamEmptyAndIKnowIt;
    }
}
