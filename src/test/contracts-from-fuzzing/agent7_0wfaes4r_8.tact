// Test 8: Using '_' as a wildcard parameter in an extension function
extends fun identity(self: Int, _: Int): Int {
    return self;
}

contract Test {
    receive() {
         dump(5.identity(10));
    }
}
