contract TestStringEquality {
    receive() {
        // Test string equality operator == in an if statement
        if ("apple" == "apple") {
            dump(1);
        } else {
            dump(0);
        }
    }
}
