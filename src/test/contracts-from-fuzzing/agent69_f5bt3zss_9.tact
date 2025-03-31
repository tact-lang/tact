// Snippet 9: Using _ as a local variable declaration without accessing it (valid usage)

contract TestLocalWildcard {
    receive() {
        let _ = 10; // valid: discard the value
    }
}
