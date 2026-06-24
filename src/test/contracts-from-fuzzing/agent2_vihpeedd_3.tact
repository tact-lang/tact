contract TestLiterals {
    receive() {
        let i = 123;           // integer literal
        let b = true;          // boolean literal
        let s = "Tact";       // string literal
        // If supported, address literal could be like: let a = 0:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef;
        // The above is commented as example
    }
}
