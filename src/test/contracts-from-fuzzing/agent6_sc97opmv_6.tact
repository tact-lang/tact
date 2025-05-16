contract TestAsciiValid {
    // Valid ascii computation: one-byte character
    a: Int = ascii("a");
    
    // dummy receive to make contract valid
    receive () {}
}
