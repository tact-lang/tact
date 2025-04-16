contract TestStringHashData {
    receive() {
        // Using the hashData function to get SHA-256 hash value (only first 127 bytes considered).
        let s: String = "Never gonna give you up!";
        let h: Int = s.hashData();
    }
}

contract TestTernaryString {
    receive() {
        // Using ternary expression with strings
        let s: String = (true ? "true" : "false");
    }
}

contract TestIntToString {
    receive() {
        // Converting an integer to string using toString() extension function
        let s: String = (42).toString();
    }
}
