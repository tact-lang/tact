// Test Snippet A: Nested block return in a regular function (should compile successfully)
contract NestedReturn {
    fun test(): Int {
        {
            if (true) { return 111; }
        }
        return 222;
    }
}
