contract Test {
    receive() {
        // Test optional String handling and ternary operator fallback
        let opt: String? = null;
        // Using ternary to provide a default if the optional is null
        let s: String = (opt != null) ? opt!! : "default";
        dump(s); // Expect output: "default"
    }
}
