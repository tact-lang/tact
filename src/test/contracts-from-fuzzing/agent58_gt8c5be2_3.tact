contract TestFunctionChaining {
    receive() {
         // Testing chaining: calling an extension function on an integer literal
         let s: String = 42.toString();
    }
}
