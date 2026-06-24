contract D {
    init() {
        // Explicit initialization
    }
    receive() {}
}

contract CallerD {
    receive() {
        // Using initOf on a contract with explicit init
        let initCell = initOf D();
        // Using codeOf on a contract with explicit init
        let codeCell = codeOf D;
    }
}
