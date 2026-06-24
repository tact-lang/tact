contract Test {
    receive(_: Slice) {
        // This fallback receiver uses an underscore to discard the parameter
    }
}
