contract TestDiscardParameter {
    // Receiver function using underscore to discard the parameter
    receive(_ : String) {
        // No operation; parameter is discarded
    }
}
