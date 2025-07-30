contract TestGetterArgs {
    // Simple getter with arguments, returning the sum of the two values
    get fun getSum(a: Int, b: Int): Int {
        return a + b;
    }

    receive() {
        let s = self.getSum(10, 15);
    }
}
