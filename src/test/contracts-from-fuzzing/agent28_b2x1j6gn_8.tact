contract TestBlock {
    receive() {
         // Block with a single statement, semicolon omitted
         { dump(456) }
         
         // Block with multiple statements, last semicolon omitted
         {
             let a: Int = 123;
             dump(a)
         }
    }
}
