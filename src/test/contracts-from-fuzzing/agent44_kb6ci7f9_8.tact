contract TestCastingCoercion {
    receive() {
         // Use ton() to convert string to an integer representing TON
         let x: Int = ton("1");
         dump(x);
    }
}
