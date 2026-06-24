contract TestNonNull2() {
    // Contract-level constant declarations must be accessed via 'self'
    const opt: Int? = 42;
    const result: Int = self.opt!!;

    // Getter to expose the computed result
    get fun getResult() : Int {
         return self.result;
    }

    receive() {
         cashback(sender());
    }
}
