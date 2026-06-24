contract TestLet {
    receive() {
        let a: Int = 5;
        let b = 10; // type inferred as Int
        if (a < b) {
            let c: Int = a + b; // block-scoped variable
        }
    }
}
