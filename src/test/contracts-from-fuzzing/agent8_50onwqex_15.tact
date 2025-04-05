contract Test {
    // Testing block statements with and without semicolon
    receive() {
         // Block with semicolon-terminated statements
         {
             let a = 10;
             dump(a);
         }
         // Block without a trailing semicolon on the last statement
         {
             let b = 20;
             dump(b)
         }
    }
}
