contract Test {
    receive() {}
    
    // Getter with multiple parameters of different types
    get fun combine(a: Int, b: String, c: Bool): String {
         // For simplicity, ignoring a and c, and returning b
         return b;
    }
}
