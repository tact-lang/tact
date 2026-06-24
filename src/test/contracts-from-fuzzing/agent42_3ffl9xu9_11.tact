fun square(x: Int): Int {
    return x * x;
}

contract TestFunctionCallChain {
    receive() {
        // Direct function call
        let a: Int = square(3);
        // Nested function call
        let b: Int = square(square(2));
        // Chaining with extension function
        let c: String = square(5).toString();
    }
}
