contract D {}

contract TestEmpty {
    receive() {
        // Test valid usage on a contract with no parameters
        let s = initOf D();
        let c = codeOf D;
        if (s.code == c) {
            return;
        }
    }
}
