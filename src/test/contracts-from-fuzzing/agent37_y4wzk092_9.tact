contract TestStringEquality2 {
    receive() {
        let a: String = "test";
        let b: String = "te\u0073t"; // \u0073 is 's'
        if (a != b) {
            throw(42); // If equality fails, throw error
        }
    }
}
