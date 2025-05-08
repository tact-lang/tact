contract G {
    // Contract with explicit init function taking two parameters of different types
    init(x: Int, y: String) {
        // No runtime logic needed
    }
    receive() { }
}

contract TestGValid {
    receive() {
        // Valid usage: Using initOf with correct parameter types and a trailing comma
        let s = initOf G(10, "hello",);
        // codeOf does not require parameters
        let c = codeOf G;
    }
}
