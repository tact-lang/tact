contract TestExternalValid {
    // Valid external receiver: expects a specific comment and no parameters
    external("external message") {
        // External receiver: no sender available
    }
}
