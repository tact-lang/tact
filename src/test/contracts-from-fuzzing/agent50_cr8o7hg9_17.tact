contract TestTernaryValid {
    receive() {
        // Valid nesting of ternary operators with proper parentheses
        dump(false ? (false ? 1 : 2) : 3); // expects 3
    }
}
