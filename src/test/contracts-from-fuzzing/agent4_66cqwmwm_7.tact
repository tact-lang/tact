contract TestUnderscoreSlice {
    receive(_: Slice) {
        // This receiver uses underscore to discard the Slice parameter
    }
}
