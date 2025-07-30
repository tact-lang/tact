// Test RF3: Nested return in a block
contract TestNestedReturn {
    fun nestedReturn(): Int {
        {
            if (true) {
                return 10;
            }
        }
        return 20;
    }
    receive() {}
}
