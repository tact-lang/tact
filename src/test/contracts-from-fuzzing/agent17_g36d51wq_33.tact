contract TestAssociativity {
    // Expect left associativity: (1 - 2) - 3 = -4
    receive() {
        dump(1 - 2 - 3); // Expected output: -4
    }
}
