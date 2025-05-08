contract TestAsciiBoundary {
    // This tests the boundary condition for ascii(), which accepts up to 32 bytes
    a: Int = ascii("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"); // exactly 32 a's
    
    receive() {}
}
