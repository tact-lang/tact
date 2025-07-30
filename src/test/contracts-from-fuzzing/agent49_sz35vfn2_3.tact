contract Test {
    receive() {
        // Test case 1: let with explicit type and initializer
        let value: Int = 123;
        // Test case 2: let with inferred type
        let inferred = 456;
        // Test case 3: let optional with explicit type
        let opt: Int? = null;
    }
}
