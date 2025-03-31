contract Test {
    receive() {
        // Testing let statement with type inference and explicit type
        let inferred = 123;        // inferred type Int
        let explicit: Int = 321;     // explicit type Int
        let sum: Int = inferred + explicit;
        dump(sum);
    }
}
