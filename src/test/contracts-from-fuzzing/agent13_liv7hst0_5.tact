contract Test {
    receive() {
         // Fuzz test: using 'get' as an identifier. 'get' is not reserved in Tact.
         let get = 5;
    }
}
