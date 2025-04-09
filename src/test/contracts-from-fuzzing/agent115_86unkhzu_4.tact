contract TestValid {
    receive() {}
}

contract CallerValid {
    receive() {
        // Validate that myCode() equals codeOf TestValid for the current contract, triggering codeOf usage
        // Note: Using myCode() in a non-current contract won't work, so we mimic documentation example.
        let cmp: Bool = myCode() == codeOf CallerValid;
    }
}
