contract B {
    // Contract with no parameters, implicit init function
    receive() { }
}

contract TestB {
    receive() {
        // Correct usage for a contract with no parameters: use initOf with empty parentheses
        let s = initOf B();
        // codeOf does not need parentheses
        let c = codeOf B;
    }
}
