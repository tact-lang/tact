contract Test {
    s: String = "Hello, world!";

    receive() {
        // testing various escape sequences in a string literal
        let t: String = "Escape test: \" quoted \n newline \t tab \\ backslash";
        
        // simulate the usage of string in a function call
        dump(t);
    }

    // helper to compile, storing dump call
    fun dump(x: String) {
        // This function intentionally left empty
    }
}
