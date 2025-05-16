contract TestPrecedenceNoParen {
    receive() {
         let a: Int = 5 * 5 - 2; // expected 23
         dump(a);
    }
}
