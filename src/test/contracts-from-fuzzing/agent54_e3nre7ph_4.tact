contract TestLet {
    receive() {
        let a: Int = 10;    // explicit type
        let b = 20;         // inferred type Int
        dump(a + b);        // should dump 30
    }
}
