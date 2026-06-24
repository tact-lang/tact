contract TestStringInterpolation {
    receive() {
        let x: Int = 42;
        // Attempt to use string interpolation-like syntax
        let s: String = "Value: {x}";
    }
}
