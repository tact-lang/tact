contract TestOptionals() {
    // Testing optionals with valid non-null usage
    fun test() {
         let opt: Int? = null;
         // Assigning a non-null value
         opt = 100;
         // Using non-null assertion operator, should output 100
         dump(opt!!);
    }

    receive() {
         self.test();
         cashback(sender());
    }
}
