contract TestCastingValid {
    receive() {
        let s: String = 42.toString();
    }
}
