contract TestUnderscoreReceiver {
    // Testing usage of underscore for discarding receiver parameter of type String
    receive(_ : String) {
        // intentionally empty
    }
}
