contract TestTernaryAssociativity {
    receive() {
        // According to docs, the ternary operator is right-associative for the alternative part.
        // This means that the expression below should be parsed as: false ? 1 : (false ? 2 : 3), resulting in 3.
        let a: Int = false ? 1 : false ? 2 : 3;
        dump(a); // Expected output: 3
    }
}
