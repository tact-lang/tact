contract Test {
    receive() {
         // Testing assignment statement: valid reassignment of a variable
         let a: Int = 10;
         a = 20;
         dump(a);
    }
}
