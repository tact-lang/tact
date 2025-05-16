contract TestGetterBlock2 {
    // A getter function returning an Int, demonstrating nested blocks with early return
    get fun getValue(): Int {
         {
             let a = 10;
             if (a > 5) {
                 return 123;
             }
         }
         return 456;
    }

    receive () {}
}
