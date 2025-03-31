contract Test {
    receive(_ : Slice) { // fallback receiver discards parameter
        // intentionally empty
    }
}
