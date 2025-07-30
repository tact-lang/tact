contract Test {
    receive() {
        // Test arithmetic right shift on negative number
        // According to docs, arithmetic right shift maintains sign. For -8, we expect -8 >> 1 to be -4.
        let a: Int = -8 >> 1;
        dump(a); // expected output: -4
    }
}
