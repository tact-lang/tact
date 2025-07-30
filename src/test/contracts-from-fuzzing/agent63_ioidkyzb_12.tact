contract TestCodeOf {
    receive() {
        // Compare the current contract code obtained via myCode() with that from codeOf
        dump(myCode() == codeOf TestCodeOf); // expected to dump true
    }
}
