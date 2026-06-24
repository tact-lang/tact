contract StateTest {
    // Persistent state variable declared using contract fields syntax
    a: Int = 0;

    // Getter that modifies the state variable (runtime modification is allowed even though changes aren't saved persistently)
    get fun getAPlus(): Int {
        self.a = self.a + 1;
        return self.a;
    }

    // A simple receive function to allow contract deployment
    receive() {
        // do nothing
    }
}
