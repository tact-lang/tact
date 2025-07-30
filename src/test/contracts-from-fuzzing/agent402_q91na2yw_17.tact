contract Test {
    receive("ping") {
        return  // missing semicolon (optional), no expression
    }
}