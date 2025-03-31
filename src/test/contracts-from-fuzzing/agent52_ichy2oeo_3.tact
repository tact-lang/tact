// Test 1: if-else statement
contract TestIfElse {
    fun choose(a: Bool): Int {
        if(a) { return 1; } else { return 2; }
    }
    receive() {
        let res = self.choose(true);
    }
}
