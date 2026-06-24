contract TestLeftAssociativity {
    receive() {
         let a: Int = 20 - 5 - 3; // expected: (20-5)-3 = 12
    }
}
