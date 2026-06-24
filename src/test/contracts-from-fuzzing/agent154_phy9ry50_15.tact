contract Test {
    // External receiver with underscore to discard the parameter
    // This receiver intentionally does not call acceptMessage(), which is allowed at compile-time
    external(_msg: String) {
        // process the external message without accepting it
    }
}
