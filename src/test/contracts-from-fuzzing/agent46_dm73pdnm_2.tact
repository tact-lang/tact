contract BounceRaw {
    // Bounce receiver using a raw Slice
    bounced(rawMsg: Slice) {
        // Optionally process the raw bounce message
    }

    // Minimal receive function to allow deployment
    receive() {
    }
}
