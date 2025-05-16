contract TestNestedTernary {
    receive() {
         // Testing nested ternary operator associativity for alternative cases
         let result: Int = false ? 1 : false ? 2 : 3; // Expected to yield 3
    }
}
