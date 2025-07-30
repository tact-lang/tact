contract Test {
    receive() {
        // Testing StringBuilder concatenation using chained concat method
        let sb: StringBuilder = beginString()
            .concat("Hello, ")
            .concat("Tact!");
        let s: String = sb.toString();
        // Using equality operator to test expected result
        if (s != "Hello, Tact!") {
            throw(1);
        }
    }
}
