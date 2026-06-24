contract TestTernaryString {
    receive() {
        // Use a ternary operator to select one of two string literals
        dump(true ? "yes" : "no");
    }
}
