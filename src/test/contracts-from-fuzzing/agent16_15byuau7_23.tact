contract TestContract {
    receive() {
        // Attempt ASCII compile-time conversion using an unpaired surrogate
        let s = ascii("\uD800");
    }
}
