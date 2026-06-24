trait T {
    // Define a function with name foo()
    fun foo(): Int { return 1; }
}

// Contract with a contract parameter also named "foo"
// This can lead to a naming conflict between the field and the method declared in trait T
contract C(foo: Int) with T {
    // Note: No init() function is used, so contract parameters syntax applies

    receive() {
        // Attempt to call the function foo() via self
        // The potential ambiguity: does self.foo refer to the contract field or the trait function?
        let result = self.foo();
        dump(result);
    }
}

fun main() {
    // Instantiate contract C with parameter foo = 100
    let _ = initOf C(100);
}
